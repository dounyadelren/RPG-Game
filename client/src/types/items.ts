export const ItemsValues = ['helmet', 'weapon', 'shield'] as const

export const ItemsLabel: Record<typeof ItemsValues[number], string> = {
  helmet: 'Casque',
  weapon: 'Arme',
  shield: 'Bouclier',
}

export const ItemsImageLabel: Record<typeof ItemsValues[number], string> = {
  helmet: '/src/assets/img/helmet.svg',
  weapon: '/src/assets/img/weapon.svg',
  shield: '/src/assets/img/shield.svg',
}
