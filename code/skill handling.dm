/*
skill handling.dm

More of skill definitions.dm, pretty much.

*/

mob/game
	proc


		ApplySkillExperience(name, expadd)
			var/skill/S = GetSkill(name)
			S.ApplyExperience(expadd)
			var/ret = ApplySkillFocus(name, expadd)
			if(ret >= 2)
				client.show_interface(1)

		ApplySkillFocus(name, focusadd)
			var/ret = 1
			var/skill/S = GetSkill(name)
			if(!S.CanApplyFocus(INCREASE))
				return
			var/focusapply = 0
			var/decrease_skills[] = list()
			for(var/skill/P in skill_list)
				if(P.CanApplyFocus(DECREASE))
					decrease_skills += P
			while(focusapply < focusadd)
				if(!S.CanApplyFocus(INCREASE))
					break
				if(decrease_skills.len == 0)
					break
				var/skill/P = pick(decrease_skills)
				if(!P.CanApplyFocus(DECREASE))
					decrease_skills -= P
					continue
				ret += P.ApplyFocus(-1) - 1
				ret += S.ApplyFocus(1) - 1
				focusapply++
			return ret


		GetSkillMod(name, divisor)
			var/skill/S
			var/mod
			if(src.key)
				S = GetSkill(name)
				mod = S.level
			else
				if(name == "combat")
					mod = src:combat
				else
					mod = src:shielding
			mod /= divisor
			if(src.key)
				mod *= S.focus
			else
				if(name == "combat")
					mod *= src:combat_focus
				else
					mod *= src:shielding_focus
			mod /= 100
			return round(mod)

		GetSkill(name)
			for(var/skill/S in skill_list)
				if(S.name == name)
					return S

		GetSkillLevel(name)
			var/skill/S = GetSkill(name)
			return S.level

		GetSkillFocus(name)
			var/skill/S = GetSkill(name)
			return S.focus

		SkillCheck(name, level=1, prob=100)
			if(src.key)
				var/skill/S = GetSkill(name)
				if(S.level >= level)
					var/random = rand(0, prob)
					if(S.focus >= random)
						return S.focus
			else
				if(name == "combat")
					if(src:combat_focus >= rand(0, prob))
						return src:combat_focus
				else
					if(src:shielding_focus >= rand(0, prob))
						return src:shielding_focus
			return 0

		SkillCheckExp(name, level=1, prob=100, exp=1, lose_stamina=1)
			var/result = SkillCheck(name, level, prob)
			if(src.key)
				var/expmod = exp
				if(!result)
					expmod = round(exp * 0.7)
				ApplySkillExperience(name, expmod)
				exptotal += expmod
				expsession += expmod
			var/stamod = round(rand(exp*0.7,exp) * lose_stamina)
			if(stamod > 150)
				stamod -= 150
				stamod /= 2
				stamod += 150
			if(stamod > 100)
				stamod -= 100
				stamod /= 2
				stamod += 100
			if(weather_counter)
				ChangeStamina(round(-stamod * 1.5))
			else
				ChangeStamina(-stamod)

			return result

