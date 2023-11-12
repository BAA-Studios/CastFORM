// Generated using Forecast on Saturday, 11. November 2023 08:43PM UTC
//     See: https://github.com/KOOKIIEStudios/Forecast
const Set<String> setAbbreviations = {
  "BS",
  // Base Set
  "JU",
  // Jungle
  "FO",
  // Fossil
  "B2",
  // Base Set 2
  "TR",
  // Team Rocket
  "G1",
  // Gym Heroes
  "G2",
  // Gym Challenge
  "N1",
  // Neo Genesis
  "N2",
  // Neo Discovery
  "N3",
  // Neo Revelation
  "N4",
  // Neo Destiny
  "LC",
  // Legendary Collection
  "EX",
  // Expedition Base Set
  "AQ",
  // Aquapolis
  "SK",
  // Skyridge
  "RS",
  // EX Ruby & Sapphire
  "SS",
  // EX Sandstorm
  "DR",
  // EX Dragon
  "MA",
  // EX Team Magma vs Team Aqua
  "HL",
  // EX Hidden Legends
  "FL",
  // EX FireRed & LeafGreen
  "TRR",
  // EX Team Rocket Returns
  "DX",
  // EX Deoxys
  "EM",
  // EX Emerald
  "UF",
  // EX Unseen Forces
  "DS",
  // EX Delta Species
  "LM",
  // EX Legend Maker
  "HP",
  // EX Holon Phantoms
  "CG",
  // EX Crystal Guardians
  "DF",
  // EX Dragon Frontiers
  "PK",
  // EX Power Keepers
  "DP",
  // Diamond & Pearl
  "MT",
  // Diamond & Pearl\u2014Mysterious Treasures
  "SW",
  // Diamond & Pearl\u2014Secret Wonders
  "GE",
  // Diamond & Pearl\u2014Great Encounters
  "MD",
  // Diamond & Pearl\u2014Majestic Dawn
  "LA",
  // Diamond & Pearl\u2014Legends Awakened
  "SF",
  // Diamond & Pearl\u2014Stormfront
  "PL",
  // Platinum
  "RR",
  // Platinum\u2014Rising Rivals
  "SV",
  // Platinum\u2014Supreme Victors
  "AR",
  // Platinum\u2014Arceus
  "HS",
  // HeartGold & SoulSilver
  "UL",
  // HS\u2014Unleashed
  "UD",
  // HS\u2014Undaunted
  "TM",
  // HS\u2014Triumphant
  // "CL",  // Pok\u00e9mon TCG: Call of Legends - Clashes with the 2023 Pokémon Trading Card Game Classic
  "BLW",
  // Black & White
  "EPO",
  // Black & White\u2014Emerging Powers
  "NVI",
  // Black & White\u2014Noble Victories
  "NXD",
  // Black & White\u2014Next Destinies
  "DEX",
  // Black & White\u2014Dark Explorers
  "DRX",
  // Black & White\u2014Dragons Exalted
  "DRV",
  // Dragon Vault
  "BCR",
  // Black & White\u2014Boundaries Crossed
  "PLS",
  // Black & White\u2014Plasma Storm
  "PLF",
  // Black & White\u2014Plasma Freeze
  "PLB",
  // Black & White\u2014Plasma Blast
  "LTR",
  // Black & White\u2014Legendary Treasures
  "KSS",
  // XY\u2014Kalos Starter Set
  "XY",
  // XY
  "FLF",
  // XY\u2014Flashfire
  "FFI",
  // XY\u2014Furious Fists
  "PHF",
  // XY\u2014Phantom Forces
  "PRC",
  // XY\u2014Primal Clash
  "DCR",
  // Double Crisis
  "ROS",
  // XY\u2014Roaring Skies
  "AOR",
  // XY\u2014Ancient Origins
  "BKT",
  // XY\u2014BREAKthrough
  "BKP",
  // XY\u2014BREAKpoint
  "GEN",
  // Generations
  "FCO",
  // XY\u2014Fates Collide
  "STS",
  // XY\u2014Steam Siege
  "EVO",
  // XY\u2014Evolutions
  "SUM",
  // Sun & Moon
  "GRI",
  // Sun & Moon\u2014Guardians Rising
  "BUS",
  // Sun & Moon\u2014Burning Shadows
  "SLG",
  // Shining Legends
  "CIN",
  // Sun & Moon\u2014Crimson Invasion
  "UPR",
  // Sun & Moon\u2014Ultra Prism
  "FLI",
  // Sun & Moon\u2014Forbidden Light
  "CES",
  // Sun & Moon\u2014Celestial Storm
  "DRM",
  // Dragon Majesty
  "LOT",
  // Sun & Moon\u2014Lost Thunder
  "TEU",
  // Sun & Moon\u2014Team Up
  "DET",
  // Detective Pikachu
  "UNB",
  // Sun & Moon\u2014Unbroken Bonds
  "UNM",
  // Sun & Moon\u2014Unified Minds
  "HIF",
  // Hidden Fates
  "CEC",
  // Sun & Moon\u2014Cosmic Eclipse
  "SSH",
  // Sword & Shield
  "RCL",
  // Sword & Shield\u2014Rebel Clash
  "DAA",
  // Sword & Shield\u2014Darkness Ablaze
  "CPA",
  // Champion's Path
  "VIV",
  // Sword & Shield\u2014Vivid Voltage
  "SHF",
  // Shining Fates
  "BST",
  // Sword & Shield\u2014Battle Styles
  "CRE",
  // Sword & Shield\u2014Chilling Reign
  "EVS",
  // Sword & Shield\u2014Evolving Skies
  "CEL",
  // Celebrations
  "FST",
  // Sword & Shield\u2014Fusion Strike
  "BRS",
  // Sword & Shield\u2014Brilliant Stars
  "ASR",
  // Sword & Shield\u2014Astral Radiance
  "PGO",
  // Pok\u00e9mon TCG: Pok\u00e9mon GO
  "LOR",
  // Sword & Shield\u2014Lost Origin
  "SIT",
  // Sword & Shield\u2014Silver Tempest
  "CRZ",
  // Crown Zenith
  "SVI",
  // Scarlet & Violet
  "PAL",
  // Scarlet & Violet\u2014Paldea Evolved
  "OBF",
  // Scarlet & Violet\u2014Obsidian Flames
  "MEW",
  // Scarlet & Violet\u2014151
  "PAR",
  // Scarlet & Violet\u2014Paradox Rift
  "SVE",
  // SVE Basic Energies
  "WP",
  // Wizards Black Star Promos
  "NP",
  // Nintendo Black Star Promos
  "DPP",
  // DP Black Star Promos
  "HSP",
  // HGSS Black Star Promos
  "BWP",
  // BW Black Star Promos
  "XYP",
  // XY Black Star Promos
  "SMP",
  // SM Black Star Promos
  "SSP",
  // SWSH Black Star Promos
  "SVP",
  // SVP Black Star Promos
  "MCD11",
  // McDonald's Collection 2011
  "MCD12",
  // McDonald's Collection 2012
  "MCD13",
  // McDonald's Collection 2013
  "MCD14",
  // McDonald's Collection 2014
  "MCD15",
  // McDonald's Collection 2015
  "MCD16",
  // McDonald's Collection 2016
  "MCD17",
  // McDonald's Collection 2017
  "MCD18",
  // McDonald's Collection 2018
  "MCD19",
  // McDonald's Collection 2019
  "MCD21",
  // McDonald's Collection 2021
  "MCD22",
  // McDonald's Collection 2022
  "M23",
  // McDonald's Collection 2023
  "POP1",
  // POP Series 1
  "POP2",
  // POP Series 2
  "POP3",
  // POP Series 3
  "POP4",
  // POP Series 4
  "POP5",
  // POP Series 5
  "POP6",
  // POP Series 6
  "POP7",
  // POP Series 7
  "POP8",
  // POP Series 8
  "POP9",
  // POP Series 9
  "PPS1",
  // Play! Pok\u00e9mon Prize Pack Series One
  "PPS2",
  // Play! Pok\u00e9mon Prize Pack Series Two
  "PPS3",
  // Play! Pok\u00e9mon Prize Pack Series Three
  "SI",
  // Southern Islands
  "CC",
  // Pok\u00e9 Card Creator Pack
  "RM",
  // Pok\u00e9mon Rumble
  "FUT20",
  // Pok\u00e9mon Futsal
  "CL",
  // Pok\u00e9mon Trading Card Game Classic
};
