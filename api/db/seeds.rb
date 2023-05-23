players = Player.create(username: "Admin", email: "admin@admin.com", password: "motdepasse", friendsRequests: [], friends: [], friendsBan: [], conversations: [], roles: 1)
players = Player.create(username: "Player", email: "player@gmail.com", password: "motdepasse", friendsRequests: [], friends: [], friendsBan: [], conversations: [], roles: 2)
players = Player.create(username: "GameMaster", email: "gm@gmail.com", password: "motdepasse", friendsRequests: [], friends: [], friendsBan: [], conversations: [], roles: 3)

roles = Role.create(role: "Admin")
roles = Role.create(role: "Player")
roles = Role.create(role: "GM")

characters = Character.create(name: "jusdorange3000", level: 1, xp: 0, PV: 80, STR: 10, inventory: 1, pointsStats: 10, quests: [], fights: [], questsDone: [], player: 2, imageId: 1)

inventories = Inventory.create(gold: 500, items: [], nbItems: 0)

items = Item.create(name: "Masque de nuit", description: "Vous permet de mieux récupérer vos PV pendant la nuit", typeOfEquipment: "helmet", level: 4, price: 100)
items = Item.create(name: "Spray anti-moustique", description: "Vous permet de vous protéger contre les suceurs de sang", typeOfEquipment: "weapon", level: 3, price: 50)
items = Item.create(name: "Le parapluie Lidl", description: "Pas sûr qu'il serve à grand chose...", typeOfEquipment: "weapon", level: 1, price: 5)
items = Item.create(name: "Le fidèle Zippo", description: "Super pratique ! Quand y'a de l'essence dedans", typeOfEquipment: "shield", level: 4, price: 100)

oponents = Oponent.create(name: "Moustique affamé", level: 2, PV: 10, STR: 2, helmet: 1, weapon: 1, shield: 1)
oponents = Oponent.create(name: "Ours gourmand", level: 10, PV: 10, STR: 5, helmet: 2, weapon: 2, shield: 2)
oponents = Oponent.create(name: "La tempête de grêle", level: 20, PV: 40, STR: 10, helmet: 1, weapon: 1, shield: 1)
oponents = Oponent.create(name: "Le céréale killer", level: 40, PV: 50, STR: 20, helmet: 2, weapon: 2, shield: 2)
oponents = Oponent.create(name: "Le craquage mental", level: 50, PV: 100, STR: 40, helmet: 1, weapon: 1, shield: 1)

pnj = Pnj.create(name: "Le bûcheron canadien qui passait par là")

enigme = Enigme.create(question: "De quelle couleur est le cheval blanc d'Henry IV?", first_answer: "Blanc", second_answer: "Ecru", third_answer: "Je suis daltonien", fourth_answer: "Je n'ai pas compris la question", correct_answer: "Blanc")
enigme = Enigme.create(question: "Les personnages du film 'Les bagnoles' ont-ils une assurance vie ou une assurance automobile?", first_answer: "Automobile vroum vroum", second_answer: "Assurance vie", third_answer: "Meilleur film de tout les temps", fourth_answer: "Je n'ai pas compris la question", correct_answer: "Meilleur film de tout les temps")
enigme = Enigme.create(question: "Comment on appelle les pyramides en Egypte ?", first_answer: "Des HLM", second_answer: "Ce tombeau sera votre tombeau!", third_answer: "Team chlaustro", fourth_answer: "Je n'ai pas compris la question", correct_answer: "Des HLM")
enigme = Enigme.create(question: "Comment Jésus a fait pour clouer sa deuxième main?", first_answer: "Un seul moyen de savoir: le faire", second_answer: "Il a eu de l'aide", third_answer: "Il avait des tendances SM", fourth_answer: "... C'est quoi ce jeu?", correct_answer: "Il avait des tendances SM")
enigme = Enigme.create(question: "Pourquoi avons nous des sourcils?", first_answer: "Pour faire des browlifts", second_answer: "Parce que t'es nul", third_answer: "Parce que...", fourth_answer: "Et du coup on gagne quoi?", correct_answer: "Pour faire des browlifts")

quests = Quest.create(level: 3, XP: 20, gold: 5, title: "Protégez vous!", objective: "Défendez vous contre les moustiques affamés suceurs de sang, équipez vous intelligemment pour ne pas subir trop de dégâts", pnj: 1, enigme: 1, oponent: 1, imageId: 4)
quests = Quest.create(level: 5, XP: 30, gold: 10, title: "L'ours gourmand", objective: "Vous avez laissé vos marshmallow trainer... Vous êtes stupides ! Un ours gourmand se pointe vous piquer vos friandises. On prie pour vous.", pnj: 1, enigme: 2, oponent: 2, imageId: 5)
quests = Quest.create(level: 10, XP: 50, gold: 40, title: "La pluie s'en vient", objective: "Vous n'auriez pas dû faire confiance à Météo France, vous voilà trempé jusqu'aux os!", pnj: 1, enigme: 3, oponent: 3, imageId: 6)
quests = Quest.create(level: 15, XP: 70, gold: 50, title: "Le gluten mortel", objective: "Flash spécial, le tueur en série nécrophile s'est enfui de sa détention. Il est localisé dans la zone où vous avez installé votre tente... RIP", pnj: 1, enigme: 4, oponent: 4, imageId: 7)
quests = Quest.create(level: 15, XP: 70, gold: 50, title: "I love Xanax", objective: "Ca y est, 5ème jour de camping. Vous craquez. Vite la civilisation!", pnj: 1, enigme: 5, oponent: 5, imageId: 8)