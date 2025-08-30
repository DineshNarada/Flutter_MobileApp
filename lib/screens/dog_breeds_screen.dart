import 'package:flutter/material.dart';

class DogBreedsScreen extends StatefulWidget {
  const DogBreedsScreen({Key? key}) : super(key: key);

  @override
  State<DogBreedsScreen> createState() => _DogBreedsScreenState();
}

class _DogBreedsScreenState extends State<DogBreedsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final List<String> breedGroups = [
    'Understanding',
    'Popular Groups',
    'Working Dogs',
    'Herding Dogs',
    'Sporting Dogs',
    'Hound Dogs',
    'Toy Dogs',
    'Terriers',
    'Non-Sporting',
    'Mixed Breeds',
    'Choosing',
    'Final Thoughts'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: breedGroups.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    _tabController.animateTo(index);
    // Calculate scroll position based on index
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetPosition = index * screenHeight * 0.8;
    
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Dog Breeds Guide',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown.shade800,
                Colors.orange.shade700,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.pets, color: Colors.white),
            onPressed: () => _scrollToSection(0),
            tooltip: 'Go to Understanding',
          ),
          IconButton(
            icon: const Icon(Icons.category, color: Colors.white),
            onPressed: () => _scrollToSection(2),
            tooltip: 'Go to Working Dogs',
          ),
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => _scrollToSection(10),
            tooltip: 'Go to Choosing Guide',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.brown.shade700,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: breedGroups.map((group) => Tab(text: group)).toList(),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.orange,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUnderstandingSection(),
          _buildPopularGroupsSection(),
          _buildWorkingDogsSection(),
          _buildHerdingDogsSection(),
          _buildSportingDogsSection(),
          _buildHoundDogsSection(),
          _buildToyDogsSection(),
          _buildTerriersSection(),
          _buildNonSportingSection(),
          _buildMixedBreedsSection(),
          _buildChoosingSection(),
          _buildFinalThoughtsSection(),
        ],
      ),
    );
  }

  Widget _buildUnderstandingSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader('🐾 Understanding Dog Breeds', Colors.brown),
          const SizedBox(height: 20),
          _buildContentCard(
            'Dogs come in all shapes, sizes, and personalities. With over 340 recognized breeds worldwide, each dog breed offers something unique—whether it\'s companionship, protection, athleticism, or just a whole lot of love. Understanding dog breeds can help current and future dog owners find the perfect canine companion to suit their lifestyle and preferences.',
            Colors.brown.shade50,
          ),
          const SizedBox(height: 20),
          _buildContentCard(
            'A dog breed is a group of dogs that share similar physical characteristics, temperaments, and behaviors due to selective breeding. These characteristics are maintained through careful breeding to ensure consistency across generations. Dog breeds are generally categorized by their original purpose, such as herding, hunting, guarding, or companionship.',
            Colors.orange.shade50,
          ),
        ],
      ),
    );
  }

  Widget _buildPopularGroupsSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader('🏡 Popular Dog Breed Groups', Colors.blue),
          const SizedBox(height: 20),
          _buildContentCard(
            'The American Kennel Club (AKC) and other organizations group breeds into categories. Here are some of the most well-known groups:',
            Colors.blue.shade50,
          ),
          const SizedBox(height: 20),
          _buildBreedGroupGrid(),
        ],
      ),
    );
  }

  Widget _buildWorkingDogsSection() {
    return _buildBreedGroupDetail(
      'Working Dogs',
      'These breeds were developed to perform practical tasks such as guarding property, pulling sleds, or rescuing people.',
      ['Siberian Husky', 'Rottweiler', 'Doberman Pinscher', 'Boxer'],
      'Strong, intelligent, loyal, protective',
      Colors.red,
    );
  }

  Widget _buildHerdingDogsSection() {
    return _buildBreedGroupDetail(
      'Herding Dogs',
      'Originally bred to herd livestock, herding dogs are energetic and highly trainable.',
      ['Border Collie', 'Australian Shepherd', 'German Shepherd'],
      'Smart, obedient, active, responsive to training',
      Colors.green,
    );
  }

  Widget _buildSportingDogsSection() {
    return _buildBreedGroupDetail(
      'Sporting Dogs',
      'These dogs were bred to assist hunters by retrieving or pointing out game.',
      ['Golden Retriever', 'Labrador Retriever', 'Cocker Spaniel'],
      'Friendly, energetic, good swimmers, great with families',
      Colors.blue,
    );
  }

  Widget _buildHoundDogsSection() {
    return _buildBreedGroupDetail(
      'Hound Dogs',
      'Used for tracking and chasing game, hounds have an incredible sense of smell or exceptional stamina.',
      ['Beagle', 'Basset Hound', 'Greyhound'],
      'Curious, driven, vocal, determined',
      Colors.purple,
    );
  }

  Widget _buildToyDogsSection() {
    return _buildBreedGroupDetail(
      'Toy Dogs',
      'Small in size but big in personality, toy breeds are often lap dogs and great companions.',
      ['Chihuahua', 'Pomeranian', 'Shih Tzu', 'Pug'],
      'Affectionate, alert, portable, great for apartment living',
      Colors.pink,
    );
  }

  Widget _buildTerriersSection() {
    return _buildBreedGroupDetail(
      'Terriers',
      'Originally used for hunting vermin, terriers are feisty, energetic, and fearless.',
      ['Jack Russell Terrier', 'Scottish Terrier', 'Bull Terrier'],
      'Spirited, confident, bold, loves digging',
      Colors.orange,
    );
  }

  Widget _buildNonSportingSection() {
    return _buildBreedGroupDetail(
      'Non-Sporting Dogs',
      'This is a diverse group of breeds with varying sizes and purposes.',
      ['Dalmatian', 'Bulldog', 'Poodle'],
      'Varies widely—some are calm, others are active or aloof',
      Colors.teal,
    );
  }

  Widget _buildMixedBreedsSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader('🐕 Mixed Breeds', Colors.indigo),
          const SizedBox(height: 20),
          _buildContentCard(
            'Not every dog fits neatly into one breed. Mixed breeds or "mutts" often combine the best traits of several breeds and are just as loving and loyal.',
            Colors.indigo.shade50,
          ),
          const SizedBox(height: 20),
          _buildContentCard(
            'Unique, healthy (often with fewer inherited diseases), full of surprises!',
            Colors.indigo.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildChoosingSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader('🏡 Choosing the Right Breed', Colors.deepPurple),
          const SizedBox(height: 20),
          _buildContentCard(
            'When selecting a breed, consider:',
            Colors.deepPurple.shade50,
          ),
          const SizedBox(height: 20),
          _buildChoosingFactors(),
        ],
      ),
    );
  }

  Widget _buildFinalThoughtsSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader('💡 Final Thoughts', Colors.amber),
          const SizedBox(height: 20),
          _buildContentCard(
            'Every dog is an individual, regardless of breed. While genetics play a role, love, training, and care shape a dog\'s personality just as much. Whether you\'re drawn to a purebred or a lovable mutt from the shelter, the best dog for you is one that fits your lifestyle and captures your heart.',
            Colors.amber.shade50,
          ),
          const SizedBox(height: 20),
          _buildContentCard(
            'Remember: A dog isn\'t just a pet—it\'s a lifelong companion. Choose wisely, love deeply, and enjoy the incredible journey of being a dog owner.',
            Colors.amber.shade100,
            isHighlighted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildContentCard(String content, Color backgroundColor, {bool isHighlighted = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: Colors.amber, width: 2) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBreedGroupGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildGroupCard('Working Dogs', Icons.work, Colors.red),
        _buildGroupCard('Herding Dogs', Icons.pets, Colors.green),
        _buildGroupCard('Sporting Dogs', Icons.sports, Colors.blue),
        _buildGroupCard('Hound Dogs', Icons.search, Colors.purple),
        _buildGroupCard('Toy Dogs', Icons.toys, Colors.pink),
        _buildGroupCard('Terriers', Icons.dangerous, Colors.orange),
        _buildGroupCard('Non-Sporting', Icons.star, Colors.teal),
        _buildGroupCard('Mixed Breeds', Icons.shuffle, Colors.indigo),
      ],
    );
  }

  Widget _buildGroupCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      color: color.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreedGroupDetail(
    String title,
    String description,
    List<String> breeds,
    String traits,
    Color color,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          _buildSectionHeader(title, color),
          const SizedBox(height: 20),
          _buildContentCard(description, color.withValues(alpha: 0.1)),
          const SizedBox(height: 20),
          _buildSectionHeader('Popular Breeds', color),
          const SizedBox(height: 10),
          ...breeds.map((breed) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: _buildBreedChip(breed, color),
          )),
          const SizedBox(height: 20),
          _buildSectionHeader('Key Traits', color),
          const SizedBox(height: 10),
          _buildContentCard(traits, color.withValues(alpha: 0.2)),
        ],
      ),
    );
  }

  Widget _buildBreedChip(String breed, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        breed,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildChoosingFactors() {
    return Column(
      children: [
        _buildFactorCard('Living Space', 'Large dogs may need a yard, while small breeds do well in apartments', Icons.home),
        _buildFactorCard('Activity Level', 'Active breeds need daily exercise and mental stimulation', Icons.directions_run),
        _buildFactorCard('Temperament', 'Some dogs are naturally more independent, while others are clingy or protective', Icons.psychology),
        _buildFactorCard('Allergies', 'Hypoallergenic breeds like Poodles or Bichon Frises may be better for allergy sufferers', Icons.healing),
        _buildFactorCard('Experience Level', 'First-time owners may want to start with a more trainable and even-tempered breed', Icons.school),
      ],
    );
  }

  Widget _buildFactorCard(String title, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.deepPurple),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
