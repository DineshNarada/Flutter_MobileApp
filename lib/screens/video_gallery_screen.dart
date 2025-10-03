import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoGalleryScreen extends StatefulWidget {
  const VideoGalleryScreen({Key? key}) : super(key: key);

  @override
  State<VideoGalleryScreen> createState() => _VideoGalleryScreenState();
}

class _VideoGalleryScreenState extends State<VideoGalleryScreen> {
  final List<Map<String, String>> videos = [
    {'path': 'assets/videos/videoplayback.mp4', 'title': 'Dog Video 1'},
    {'path': 'assets/videos/videoplayback(1).mp4', 'title': 'Dog Video 2'},
    {'path': 'assets/videos/videoplayback(2).mp4', 'title': 'Dog Video 3'},
    {'path': 'assets/videos/History_of_dogs.mp4', 'title': 'History of Dogs'},
    {'path': 'assets/videos/Dog_Breeds.mp4', 'title': 'Dog Breeds'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Gallery'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 16 / 9,
          ),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return VideoCard(
                video: videos[index], index: index, videos: videos);
          },
        ),
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final Map<String, String> video;
  final int index;
  final List<Map<String, String>> videos;

  const VideoCard(
      {Key? key,
      required this.video,
      required this.index,
      required this.videos})
      : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video['path']!)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              video: widget.video,
              index: widget.index,
              videos: widget.videos,
              controller: _controller,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            if (_isInitialized)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withValues(alpha: 0.3),
                ),
                child: const Icon(
                  Icons.play_circle_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final Map<String, String> video;
  final int index;
  final List<Map<String, String>> videos;
  final VideoPlayerController controller;

  const VideoPlayerScreen({
    Key? key,
    required this.video,
    required this.index,
    required this.videos,
    required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _goToPreviousVideo() {
    if (widget.index > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(
            video: widget.videos[widget.index - 1],
            index: widget.index - 1,
            videos: widget.videos,
            controller: VideoPlayerController.asset(
                widget.videos[widget.index - 1]['path']!)
              ..initialize(),
          ),
        ),
      );
    }
  }

  void _goToNextVideo() {
    if (widget.index < widget.videos.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(
            video: widget.videos[widget.index + 1],
            index: widget.index + 1,
            videos: widget.videos,
            controller: VideoPlayerController.asset(
                widget.videos[widget.index + 1]['path']!)
              ..initialize(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video['title']!),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? Chewie(controller: _chewieController)
                  : const CircularProgressIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: widget.index > 0 ? _goToPreviousVideo : null,
                  icon: const Icon(Icons.skip_previous),
                  label: const Text('Previous'),
                ),
                ElevatedButton.icon(
                  onPressed: widget.index < widget.videos.length - 1
                      ? _goToNextVideo
                      : null,
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
