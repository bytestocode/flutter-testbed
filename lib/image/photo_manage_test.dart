import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class TodayPhotosPage extends StatefulWidget {
  const TodayPhotosPage({super.key});

  @override
  TodayPhotosPageState createState() => TodayPhotosPageState();
}

class TodayPhotosPageState extends State<TodayPhotosPage> {
  final int _sizePerPage = 50;

  AssetPathEntity? _path;
  List<AssetEntity>? _entities;
  int _totalEntitiesCount = 0;

  int _page = 0;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMoreToLoad = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('photo_manager')),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This page will only obtain the first page of assets '
              'under the primary album (a.k.a. Recent). '
              'If you want more filtering assets, '
              'head over to "Advanced usages".',
            ),
          ),
          Expanded(
            child: _buildBody(context),
          ),
        ],
      ),
      persistentFooterButtons: <TextButton>[
        TextButton(
          onPressed: () {
            // Navigator.of(context).push<void>(
            //   MaterialPageRoute<void>(
            //     builder: (_) => const IndexPage(),
            //   ),
            // );
          },
          child: const Text('Advanced usages'),
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: _requestAssets,
        child: const Icon(Icons.developer_board),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (_path == null) {
      return const Center(child: Text('Request paths first.'));
    }
    if (_entities?.isNotEmpty != true) {
      return const Center(child: Text('No assets found on this device.'));
    }
    return GridView.custom(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == _entities!.length - 8 &&
              !_isLoadingMore &&
              _hasMoreToLoad) {
            _loadMoreAsset();
          }
          final AssetEntity entity = _entities![index];
          return AssetEntityImage(
            entity,
            isOriginal: false,
          );
          // return ImageItemWidget(
          //   key: ValueKey<int>(index),
          //   entity: entity,
          //   option: const ThumbnailOption(
          //     size: ThumbnailSize.square(200),
          //   ),
          // );
        },
        childCount: _entities!.length,
        findChildIndexCallback: (Key key) {
          // Re-use elements.
          if (key is ValueKey<int>) {
            return key.value;
          }
          return null;
        },
      ),
    );
  }

  Future<void> _loadMoreAsset() async {
    final List<AssetEntity> entities = await _path!.getAssetListPaged(
      page: _page + 1,
      size: _sizePerPage,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _entities!.addAll(entities);
      _page++;
      _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
      _isLoadingMore = false;
    });
  }

  Future<void> _requestAssets() async {
    setState(() {
      _isLoading = true;
    });
    // Request permissions.
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!mounted) return;

    // Further requests can be only proceed with authorized or limited.
    if (!ps.hasAccess) {
      setState(() {
        _isLoading = false;
      });
      // showToast('Permission is not accessible.');
      print('Permission is not accessible.');
      return;
    }
    // 앨범 목록
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      filterOption: FilterOptionGroup(
        imageOption: const FilterOption(
          sizeConstraint: SizeConstraint(ignoreSize: true),
        ),
        createTimeCond: DateTimeCond(
          min: DateTime(2023, 03, 04, 12, 58),
          max: DateTime(2023, 12, 31),
        ),
      ),
    );
    if (!mounted) return;

    // Return if not paths found.
    if (paths.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      // showToast('No paths found.');
      print('No paths found.');
      return;
    }
    setState(() {
      _path = paths.first;
    });

    _totalEntitiesCount = await _path!.assetCountAsync;
    final List<AssetEntity> entities = await _path!.getAssetListPaged(
      page: 0,
      size: _sizePerPage,
    );
    if (!mounted) return;
    setState(() {
      _entities = entities;
      _isLoading = false;
      _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
    });
  }
}
