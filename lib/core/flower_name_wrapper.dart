class FlowerNameMapper {
  static const Map<String, Map<String, String>> flowers = {

    // =========================
    // CHANDRAMALLIKA
    // =========================
    "Chandramallika_Bulk": {
      "english": "Chrysanthemum",
      "bangla": "চন্দ্রমল্লিকা",
      "scientific": "Chrysanthemum indicum",
    },

    "Chandramallika_Single": {
      "english": "Chrysanthemum",
      "bangla": "চন্দ্রমল্লিকা",
      "scientific": "Chrysanthemum morifolium",
    },

    // =========================
    // COSMOS
    // =========================
    "Cosmos Phul_Bulk": {
      "english": "Cosmos",
      "bangla": "কসমস ফুল",
      "scientific": "Cosmos bipinnatus",
    },

    "Cosmos Phul_Single": {
      "english": "Cosmos",
      "bangla": "কসমস ফুল",
      "scientific": "Cosmos sulphureus",
    },

    // =========================
    // MARIGOLD
    // =========================
    "Gada_Bulk": {
      "english": "Marigold",
      "bangla": "গাঁদা",
      "scientific": "Tagetes erecta",
    },

    "Gada_Single": {
      "english": "Marigold",
      "bangla": "গাঁদা",
      "scientific": "Tagetes patula",
    },

    // =========================
    // ROSE
    // =========================
    "Golap_Bulk": {
      "english": "Rose",
      "bangla": "গোলাপ",
      "scientific": "Rosa rubiginosa",
    },

    "Golap_Single": {
      "english": "Rose",
      "bangla": "গোলাপ",
      "scientific": "Rosa damascena",
    },

    // =========================
    // HIBISCUS
    // =========================
    "Jaba_Bulk": {
      "english": "Hibiscus",
      "bangla": "জবা",
      "scientific": "Hibiscus rosa-sinensis",
    },

    "Jaba_Single": {
      "english": "Hibiscus",
      "bangla": "জবা",
      "scientific": "Hibiscus syriacus",
    },

    // =========================
    // BOUGAINVILLEA
    // =========================
    "Kagoj Phul_Bulk": {
      "english": "Bougainvillea",
      "bangla": "কাগজ ফুল",
      "scientific": "Bougainvillea glabra",
    },

    "Kagoj Phul_Single": {
      "english": "Bougainvillea",
      "bangla": "কাগজ ফুল",
      "scientific": "Bougainvillea spectabilis",
    },

    // =========================
    // PERIWINKLE
    // =========================
    "Noyontara_Bulk": {
      "english": "Periwinkle",
      "bangla": "নয়নতারা",
      "scientific": "Catharanthus roseus",
    },

    "Noyontara_Single": {
      "english": "Periwinkle",
      "bangla": "নয়নতারা",
      "scientific": "Catharanthus pusillus",
    },

    // =========================
    // RADHACHURA
    // =========================
    "Radhachura_Bulk": {
      "english": "Golden Shower Tree",
      "bangla": "রাধাচূড়া",
      "scientific": "Cassia fistula",
    },

    "Radhachura_Single": {
      "english": "Pink Shower Tree",
      "bangla": "রাধাচূড়া",
      "scientific": "Cassia javanica",
    },

    // =========================
    // RANGAN
    // =========================
    "Rangan_Bulk": {
      "english": "Jungle Geranium",
      "bangla": "রঙ্গন",
      "scientific": "Ixora coccinea",
    },

    "Rangan_Single": {
      "english": "Chinese Ixora",
      "bangla": "রঙ্গন",
      "scientific": "Ixora chinensis",
    },

    // =========================
    // SALVIA
    // =========================
    "Salvia_Bulk": {
      "english": "Salvia",
      "bangla": "সালভিয়া",
      "scientific": "Salvia splendens",
    },

    "Salvia_Single": {
      "english": "Salvia",
      "bangla": "সালভিয়া",
      "scientific": "Salvia farinacea",
    },

    // =========================
    // SANDHYAMANI
    // =========================
    "Sandhyamani_Bulk": {
      "english": "Four O'Clock Flower",
      "bangla": "সন্ধ্যামণি",
      "scientific": "Mirabilis jalapa",
    },

    "Sandhyamani_Single": {
      "english": "Four O'Clock Flower",
      "bangla": "সন্ধ্যামণি",
      "scientific": "Mirabilis longiflora",
    },

    // =========================
    // SUNFLOWER
    // =========================
    "Surjomukhi_Bulk": {
      "english": "Sunflower",
      "bangla": "সূর্যমুখী",
      "scientific": "Helianthus annuus",
    },

    "Surjomukhi_Single": {
      "english": "Sunflower",
      "bangla": "সূর্যমুখী",
      "scientific": "Helianthus debilis",
    },

    // =========================
    // ZINNIA
    // =========================
    "Zinnia_Bulk": {
      "english": "Zinnia",
      "bangla": "জিনিয়া",
      "scientific": "Zinnia elegans",
    },

    "Zinnia_Single": {
      "english": "Zinnia",
      "bangla": "জিনিয়া",
      "scientific": "Zinnia angustifolia",
    },
  };

  static Map<String, String> getFlowerInfo(String className) {
    return flowers[className] ??
        {
          "english": className,
          "bangla": "",
          "scientific": "",
        };
  }
}