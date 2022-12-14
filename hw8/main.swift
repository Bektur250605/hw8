//Ruslan, [9 дек. 2022 г., 19:09:34 (9 дек. 2022 г., 19:09:46)]:
//Swift | nil и опциональные типы
//Опциональные типы Optional в языке Swift, оператор !, unwrapped operator, значение nil, программирование для iOS и MacOS
//
//Ruslan, [9 дек. 2022 г., 19:09:34 (9 дек. 2022 г., 19:09:46)]:
//ДЗ №7 Опциональные типы данных и работа с ними
//
//Используя  известные вам методы создать следующие программы
//
//
//
//Дедлайн: Следующий урок(вторник)
//2
//Воин, Колдун, Медик, Защитник
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может
//Мёртвых игроков лечить нельзя и они не наносят урон

//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока не умрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

//1 раунд
//Герои атакуют
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//Босс Атакует
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Игроки победили, БОСС мертв
//9 раундов прошло
//Если ХП - 0 (т.е герой умер - делаете принт (Герой) мертв)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)


//// #1
//var name = ["shop"]
//var cost = [Int] ()
//var makers = [String]()
//var weight = [Int]()
//var total = 0
//
//for(index, item) in name.enumerated() {
//    if index == 0 {
//        name.append("apple")
//        cost.append(200)
//        makers.append("tree")
//        weight.append(4)
//
//        print("продукт \(name[1]) - цена \(cost[0]), произволитель - \(makers[0]), вес - \(weight[0])")
//
//    }
//    if index == 0 {
//        name.append("sandwich")
//        cost.append(80)
//        makers.append("Toibos")
//        weight.append(800)
//        print("\(name[2]), \(cost[1]),произволитель - \(makers[1]), вес - \(weight[1])")
//
//    }
//    if index == 0 {
//        name.append("tomato")
//        cost.append(120)
//        makers.append("Henzi")
//        weight.append(900)
//        print("\(name[3]), \(cost[2]), производитель - \(makers[2]), вес \(weight[2])г ")
//    }
//
//        if index == 0 {
//
//            cost.append(25)
//            makers.append("Ala-too")
//            weight.append(1)
//            var  finalcost = (cost[0] + cost[1] + cost[2] + cost[3]) / 100 * 5
//            var  totalcost = (cost[0] + cost[1] + cost[2] + cost[3]) - finalcost
//            print("\(name[4]), \(cost[3]), \(makers[3]), вес - \(weight[3])л")
//            print("\(cost[0] + cost[1] + cost[2] + cost[3]), со скидкой - \(finalcost), общая цена - \(totalcost)")
//        }
//
//    }

// #2
var heroes = ["Fighter", "Witch",  "healer", "defender"]
let damageHeroes = [200, 300, 0, 100]
var hpHeroes = [1000,1000,1000,1500]

var heroesDeath = [String]()
var round = 0
var heroesInfo: [String:Int] = ["Fighter":0, "Witch": 0, "healer": 0, "defender": 0, "BOSS": 0]
let damageBoss = 200
var hpBoss = 5000

func game(){
//    var round = 0
//    var bossxp = 5000
//    let bossdmg = 200
    while hpBoss != 0 || heroesDeath.count == heroes.count{
        for i in 0..<heroes.count{
            
            if hpBoss == 0 || heroesDeath.count == heroes.count{
                break
            } else {
                round += 1
                if round % 2 == 0{
                    hpHeroes[i] += 200
                }
                
                hpBoss -= damageHeroes[i]
                hpHeroes[i] -= damageBoss
                

                heroesInfo[heroes[i]]! += damageHeroes[i]
                heroesInfo["BOSS"]! += damageBoss
                
            }
            
            if hpHeroes[i] == 0{
                heroesDeath.append(heroes[i])
            }
        }
    }
    
    func searchWinner(){
        if heroesDeath.count == heroes.count{
            print("Босс победил. Данные об игре: Количество раундов: \(round). Данные об игроках: \(heroesInfo)")
        } else if hpBoss == 0 && heroesDeath.count != heroes.count{
            print("Игроки победили. Данные об игре: Количество раундов: \(round). Данные об игроках: \(heroesInfo)")
        }
    }
    
    searchWinner()
}
game()
