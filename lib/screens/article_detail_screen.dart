import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const ArticleDetailScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.brown[600],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 16),
            _buildFormattedContent(content),
          ],
        ),
      ),
    );
  }

  Widget _buildFormattedContent(String content) {
    // Split content into sections based on the structure
    if (title == 'Dog Nutrition Basics') {
      return _buildNutritionContent();
    } else if (title == 'Choosing the Right Dog Food') {
      return _buildDogFoodContent();
    } else if (title == 'Common Dog Health Issues') {
      return _buildHealthIssuesContent();
    }
    
    // Default content display for other articles
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        height: 1.6,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildNutritionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntroSection(),
        const SizedBox(height: 24),
        _buildSectionTitle('Essential Nutrients for Dogs'),
        const SizedBox(height: 16),
        _buildNutrientSection('Proteins', _getProteinsContent()),
        _buildNutrientSection('Fats', _getFatsContent()),
        _buildNutrientSection('Carbohydrates', _getCarbohydratesContent()),
        _buildNutrientSection('Vitamins and Minerals', _getVitaminsContent()),
        _buildNutrientSection('Water', _getWaterContent()),
      ],
    );
  }

  Widget _buildIntroSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown[200]!),
      ),
      child: const Text(
        'Nutrition is the foundation of your dog\'s health. A balanced diet provides the nutrients your dog needs to develop properly, maintain a healthy weight, fight off illness, and enjoy a long, vibrant life. While dogs are classified as omnivores, meaning they can eat both animal and plant-based foods, their diet should be primarily made up of high-quality animal protein and essential nutrients.',
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.brown,
      ),
    );
  }

  Widget _buildNutrientSection(String nutrientName, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.brown[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              nutrientName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getProteinsContent() {
    return 'Proteins are made up of amino acids, the building blocks of muscles, organs, enzymes, and hormones. Dogs need protein to grow, heal tissues, maintain muscle mass, and support their immune system. Good protein sources include chicken, beef, fish, turkey, lamb, and eggs. Puppies and active dogs require more protein than older or less active dogs.';
  }

  String _getFatsContent() {
    return 'Fats are the most concentrated source of energy in a dog\'s diet. They also play a crucial role in absorbing fat-soluble vitamins (A, D, E, and K), maintaining healthy skin, and producing a glossy coat. Omega-3 and omega-6 fatty acids, found in fish oil and flaxseed, help reduce inflammation and promote heart and brain health.';
  }

  String _getCarbohydratesContent() {
    return 'While not strictly necessary, carbohydrates can provide dogs with energy and fiber. Digestible carbohydrates such as brown rice, oats, and sweet potatoes are more beneficial than cheap fillers like corn and wheat. Fiber also helps regulate digestion and maintain healthy bowel movements.';
  }

  String _getVitaminsContent() {
    return 'Dogs require a range of vitamins and minerals to regulate bodily functions. For example:\n\n• Calcium and phosphorus support bone and teeth health.\n• Zinc aids in skin healing and immune function.\n• Iron is crucial for oxygen transport in the blood.\n• Vitamin A promotes healthy vision and skin.\n• Vitamin E acts as an antioxidant.';
  }

  String _getWaterContent() {
    return 'Water is often overlooked, but it is the most important nutrient of all. Dogs must always have access to clean, fresh water. Water is essential for every bodily function, from digestion and circulation to temperature regulation and toxin elimination.';
  }

  Widget _buildDogFoodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDogFoodIntroSection(),
        const SizedBox(height: 24),
        _buildSectionTitle('Consider Your Dog\'s Life Stage'),
        const SizedBox(height: 16),
        _buildDogFoodSection('Puppies', _getPuppiesContent()),
        _buildDogFoodSection('Adult Dogs', _getAdultDogsContent()),
        _buildDogFoodSection('Senior Dogs', _getSeniorDogsContent()),
        const SizedBox(height: 24),
        _buildSectionTitle('Breed Size and Activity Level'),
        const SizedBox(height: 16),
        _buildDogFoodInfoSection(_getBreedSizeContent()),
        const SizedBox(height: 24),
        _buildSectionTitle('How to Evaluate a Dog Food Label'),
        const SizedBox(height: 16),
        _buildDogFoodInfoSection(_getLabelEvaluationContent()),
        const SizedBox(height: 24),
        _buildSectionTitle('Special Diets'),
        const SizedBox(height: 16),
        _buildDogFoodInfoSection(_getSpecialDietsContent()),
      ],
    );
  }

  Widget _buildDogFoodIntroSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown[200]!),
      ),
      child: const Text(
        'Choosing the right dog food goes beyond picking the most popular brand on the shelf. Dogs have different dietary requirements depending on their age, size, breed, activity level, and any existing health issues. Tailoring your dog\'s diet to their individual needs helps ensure they get the right balance of nutrients without underfeeding or overfeeding.',
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildDogFoodSection(String stageName, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.brown[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              stageName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDogFoodInfoSection(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
        ),
      ),
    );
  }

  String _getPuppiesContent() {
    return 'Growing dogs require more protein, fat, and calories than adults. Look for foods labeled specifically for puppies or "growth and development." These formulas contain the nutrients needed for strong bones, healthy joints, and brain development.';
  }

  String _getAdultDogsContent() {
    return 'Once a dog reaches adulthood (typically 12–18 months for most breeds), their energy needs stabilize. Adult maintenance diets are designed to maintain a healthy weight and energy level without excessive calories.';
  }

  String _getSeniorDogsContent() {
    return 'Older dogs may be less active and more prone to weight gain or joint issues. Senior formulas typically have fewer calories, added antioxidants, joint-supporting ingredients like glucosamine and chondroitin, and easily digestible proteins.';
  }

  String _getBreedSizeContent() {
    return '• Small breeds have faster metabolisms and may benefit from energy-dense kibble in smaller pieces.\n\n• Large breeds are prone to joint issues, so their food should contain joint support ingredients and a controlled calcium-phosphorus ratio to prevent skeletal problems.\n\n• Highly active dogs or working breeds need more calories and protein to maintain muscle mass and energy levels.';
  }

  String _getLabelEvaluationContent() {
    return '• Check for AAFCO Statement: A label that says the food is "complete and balanced" according to AAFCO standards means it contains all essential nutrients in the correct proportions.\n\n• Ingredient List: The first few ingredients should be recognizable, whole protein sources like "chicken" or "lamb." Avoid foods with generic meat by-products, artificial colors, or preservatives like BHA/BHT.\n\n• Guaranteed Analysis: This shows the percentage of protein, fat, fiber, and moisture. Comparing this with your dog\'s needs helps ensure you\'re choosing a well-balanced product.';
  }

  String _getSpecialDietsContent() {
    return 'Some dogs may require special diets due to allergies, health conditions, or preferences. These include:\n\n• Grain-free diets: Helpful for dogs with grain allergies, though not suitable for all.\n\n• Limited-ingredient diets: Often used for food sensitivities.\n\n• Raw or homemade diets: Require careful planning to ensure nutritional balance. Always consult with a veterinarian or pet nutritionist before switching to these diets.';
  }

  Widget _buildHealthIssuesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHealthIntroSection(),
        const SizedBox(height: 24),
        _buildHealthIssueSection('1. Obesity', _getObesityContent()),
        _buildHealthIssueSection('2. Dental Disease', _getDentalDiseaseContent()),
        _buildHealthIssueSection('3. Ear Infections', _getEarInfectionsContent()),
        _buildHealthIssueSection('4. Parasites', _getParasitesContent()),
        _buildHealthIssueSection('5. Allergies', _getAllergiesContent()),
        const SizedBox(height: 24),
        _buildSectionTitle('Conclusion'),
        const SizedBox(height: 16),
        _buildHealthConclusionSection(),
      ],
    );
  }

  Widget _buildHealthIntroSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown[200]!),
      ),
      child: const Text(
        'Even with a perfect diet, dogs are still susceptible to various health issues. Knowing the signs and maintaining routine veterinary care can help you catch and treat problems early.',
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildHealthIssueSection(String issueName, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.brown[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              issueName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthConclusionSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: const Text(
        'Keeping your dog healthy starts with understanding their unique nutritional needs and being proactive about their care. Providing a balanced, high-quality diet tailored to your dog\'s life stage and lifestyle supports their long-term health. Regular veterinary visits, proper dental care, parasite prevention, and attention to behavioural or physical changes will help ensure your dog remains happy and healthy for years to come.\n\nBeing a responsible pet parent means making informed choices because your dog depends on you for everything, from what\'s in their food bowl to the quality of their everyday life.',
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _getObesityContent() {
    return 'Canine obesity is one of the most common preventable health issues. Overfeeding, too many treats, and a lack of exercise can lead to excessive weight gain. Obesity increases the risk of:\n\n• Heart disease\n• Arthritis and joint pain\n• Diabetes\n• Respiratory issues\n\nPrevent obesity by feeding measured portions, offering healthy treats, and ensuring regular physical activity.';
  }

  String _getDentalDiseaseContent() {
    return 'By age three, most dogs show signs of dental disease. Plaque and tartar buildup can lead to gum infections, tooth loss, and even damage to internal organs.\n\nSigns include:\n• Bad breath\n• Yellow or brown teeth\n• Difficulty chewing\n• Drooling or pawing at the mouth\n\nBrush your dog\'s teeth regularly, offer dental chews, and schedule professional cleanings when needed.';
  }

  String _getEarInfectionsContent() {
    return 'Dogs with floppy ears, excessive hair in the ear canal, or allergies are especially prone to ear infections. These can be painful and may lead to hearing loss if untreated.\n\nWatch for:\n• Frequent scratching or head shaking\n• Foul odor from ears\n• Redness or swelling\n\nClean ears regularly and keep them dry, especially after baths or swimming.';
  }

  String _getParasitesContent() {
    return 'Fleas, ticks, heartworms, and intestinal parasites (like roundworms or hookworms) can cause a range of health problems.\n\nSymptoms may include:\n• Itching or hair loss\n• Diarrhea or vomiting\n• Lethargy\n• Visible worms in stool\n\nUse monthly preventive medications, maintain good hygiene, and have regular vet checkups.';
  }

  String _getAllergiesContent() {
    return 'Dogs can suffer from allergies to food, fleas, or environmental triggers like pollen or dust mites.\n\nSigns of allergies include:\n• Chronic itching or licking\n• Ear infections\n• Digestive issues like diarrhoea\n• Red, inflamed skin or hot spots\n\nTreatment may involve diet changes, medications, or allergy testing by a veterinarian.';
  }
}
