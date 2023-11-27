CORE = config.framework 

FOOD = config.food 
DRINK = config.drink 
Lang = config.language
function GetCore()
    if CORE == 'esx' then 
        return exports['es_extended']:getSharedObject()
    elseif CORE == 'qb' then 
        return exports['qb-core']:GetCoreObject()
    end
end

FW = GetCore()

function UseItem()
    if CORE == 'esx' then 
        return FW.RegisterUsableItem
    elseif CORE == 'qb' then 
        return FW.Functions.CreateUseableItem
    end
end

GoodEats = UseItem()

function Replenish(types, add)
    if CORE == 'esx' then 
        TriggerEvent("esx_status:add", types, add)
    elseif CORE == 'qb' then 
        if types == 'hunger' then 
            TriggerServerEvent("consumables:server:addHunger", FW.Functions.GetPlayerData().metadata.hunger + add)
        elseif types == 'thirst' then 
            TriggerServerEvent("consumables:server:addThirst", FW.Functions.GetPlayerData().metadata.thirst + add)
        end
    end
end

function Label(item)
    if CORE == 'esx' then 
        return FW.GetItemLabel(item)
    elseif CORE == 'qb' then 
        return FW.Shared.Items[item].label
    end
end

function GetPlayer(source)
    if CORE == 'esx' then 
        return FW.GetPlayerFromId(source)
    elseif CORE == 'qb' then 
        return FW.Functions.GetPlayer(source)
    end
end

function Remove(player, item)
    if CORE  == 'esx' then 
        player.removeInventoryItem(item, 1)
    elseif CORE == 'qb' then 
        player.Functions.RemoveItem(item, 1)
    end
end

Trans = {
    ['en'] = {
        eat = 'Eating',
        drink = 'Drinking',
        err = 'Your already consuming...'
    },
    ['es'] = {
        eat = 'Comer',
        drink = 'Tomar',
        err = 'Ya estás consumiendo...'
    },
    ['ar'] = {
        eat = 'أكل',
        drink = 'شرب',
        err = 'أنت تستهلك بالفعل...'
    },
    ['de'] = {
        eat = 'Essen',
        drink = 'Trinken',
        err = 'Du konsumierst bereits...'
    },
    ['bs'] = {
        eat = 'Jesti',
        drink = 'Piti',
        err = 'Već konzumirate...'
    },
    ['cn'] = {
        eat = '吃',
        drink = '喝',
        err = '你已经在消耗...'
    },
    ['cs'] = {
        eat = 'Jíst',
        drink = 'Pít',
        err = 'Již konzumujete...'
    },
    ['da'] = {
        eat = 'Spise',
        drink = 'Drikke',
        err = 'Du forbruger allerede...'
    },
    ['ee'] = {
        eat = 'Sööma',
        drink = 'Jooma',
        err = 'Sa tarbid juba...'
    },
    ['el'] = {
        eat = 'Φαγητό',
        drink = 'Ποτό',
        err = 'Καταναλώνετε ήδη...'
    },
    ['et'] = {
        eat = 'Süüa',
        drink = 'Jooma',
        err = 'Te tarbite juba...'
    },
    ['fa'] = {
        eat = 'خوردن',
        drink = 'نوشیدن',
        err = 'شما قبلاً مصرف می‌کنید...'
    },
    ['fi'] = {
        eat = 'Syöminen',
        drink = 'Juominen',
        err = 'Olet jo kuluttamassa...'
    },
    ['fr'] = {
        eat = 'Manger',
        drink = 'Boire',
        err = 'Vous consommez déjà...'
    },
    ['ge'] = {
        eat = 'ჭამა',
        drink = 'სვანი',
        err = 'თქვენ უკვე ხართ მიყვარხართო...'
    },
    ['he'] = {
        eat = 'אכילה',
        drink = 'שתייה',
        err = 'אתה כבר מצרכן...'
    },
    ['hu'] = {
        eat = 'Evés',
        drink = 'Ivás',
        err = 'Már fogyasztasz...'
    },
    ['id'] = {
        eat = 'Makan',
        drink = 'Minum',
        err = 'Anda sudah mengonsumsi...'
    },
    ['it'] = {
        eat = 'Mangiare',
        drink = 'Bere',
        err = 'Stai già consumando...'
    },
    ['lv'] = {
        eat = 'Ēst',
        drink = 'Dzert',
        err = 'Jūs jau patērējat...'
    },
    ['nl'] = {
        eat = 'Eten',
        drink = 'Drinken',
        err = 'Je bent al aan het consumeren...'
    },
    ['no'] = {
        eat = 'Spise',
        drink = 'Drikke',
        err = 'Du forbruker allerede...'
    },
    ['pl'] = {
        eat = 'Jedzenie',
        drink = 'Picie',
        err = 'Już konsumujesz...'
    },
    ['pt'] = {
        eat = 'Comer',
        drink = 'Beber',
        err = 'Já estás a consumir...'
    },
    ['pt-br'] = {
        eat = 'Comer',
        drink = 'Beber',
        err = 'Você já está consumindo...'
    },
    ['ro'] = {
        eat = 'Mâncare',
        drink = 'Băutură',
        err = 'Deja consumi...'
    },
    ['rs'] = {
        eat = 'Jesti',
        drink = 'Piti',
        err = 'Već konzumirate...'
    },
    ['ru'] = {
        eat = 'Еда',
        drink = 'Пить',
        err = 'Вы уже потребляете...'
    },
    ['sl'] = {
        eat = 'Jesti',
        drink = 'Piti',
        err = 'Že porabljate...'
    },
    ['sv'] = {
        eat = 'Äta',
        drink = 'Dricka',
        err = 'Du konsumerar redan...'
    },
    ['th'] = {
        eat = 'กิน',
        drink = 'ดื่ม',
        err = 'คุณกำลังบริโภคแล้ว...'
    },
    ['tr'] = {
        eat = 'Yemek',
        drink = 'İçmek',
        err = 'Zaten tüketiyorsun...'
    },
    ['vn'] = {
        eat = 'Ăn',
        drink = 'Uống',
        err = 'Bạn đang tiêu thụ rồi...'
    }
}
