import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class TodayPhotosPage extends StatefulWidget {
  const TodayPhotosPage({super.key});

  @override
  TodayPhotosPageState createState() => TodayPhotosPageState();
}

class TodayPhotosPageState extends State<TodayPhotosPage> {
  final int _sizePerPage = 30;

  AssetPathEntity? _path;
  List<AssetEntity>? _entities;
  int _totalEntitiesCount = 0;

  int _page = 0;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMoreToLoad = true;

  Map<int, bool> _selected = {};
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('photo_manager'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildBody(context),
          ),
        ],
      ),
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
    if (_entities?.isEmpty ?? true) {
      return const Center(child: Text('No assets found on this device.'));
    }
    return Container(
      color: Colors.black,
      child: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index == _entities!.length - 8 &&
                !_isLoadingMore &&
                _hasMoreToLoad) {
              _loadMoreAsset();
            }
            final AssetEntity entity = _entities![index];
            final bool isSelected = _selected[index] ?? false;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                setState(() {
                  if (_selected[index] == null) {
                    _selected[index] = true;
                  }
                  _selected[index] = !_selected[index]!;
                });

                // Location location = new Location();
                //
                // bool _serviceEnabled;
                // PermissionStatus _permissionGranted;
                // LocationData _locationData;
                //
                // _serviceEnabled = await location.serviceEnabled();
                // if (!_serviceEnabled) {
                //   _serviceEnabled = await location.requestService();
                //   if (!_serviceEnabled) {
                //     return;
                //   }
                // }
                //
                // _permissionGranted = await location.hasPermission();
                // if (_permissionGranted == PermissionStatus.denied) {
                //   _permissionGranted = await location.requestPermission();
                //   if (_permissionGranted != PermissionStatus.granted) {
                //     return;
                //   }
                // }
                //
                // _locationData = await location.getLocation();

                _file = await entity.originFile;
                if (_file != null) {
                  print('file: ${_file!.path}');

                  final LatLng latlng = await entity.latlngAsync();
                  print('좌표 latlng: ${latlng.latitude}, ${latlng.longitude}');
                  print('좌표 entity: ${entity.latitude}, ${entity.longitude}');

                  final double? lat =
                      (entity.latitude == null || entity.latitude == 0)
                          ? (latlng.latitude == 0 ? null : latlng.latitude)
                          : entity.latitude;
                  final double? lng =
                      (entity.longitude == null || entity.longitude == 0)
                          ? (latlng.longitude == 0 ? null : latlng.longitude)
                          : entity.longitude;

                  print('좌표 lat: $lat, lng: $lng');
                }
              },
              child: Stack(
                children: [
                  AssetEntityImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    entity,
                    key: ValueKey<int>(index),
                    // isOriginal: false,
                    thumbnailSize: const ThumbnailSize.square(200),
                  ),
                  if (isSelected)
                    Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black54 : Colors.transparent,
                        border: Border.all(
                          color: Colors.yellowAccent,
                          width: 3,
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: 24,
                      height: 24,
                      decoration: isSelected
                          ? BoxDecoration(
                              color: Colors.yellowAccent,
                              border: Border.all(
                                color: Colors.yellowAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                      child: isSelected
                          ? const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 16,
                              ),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: _entities!.length,
          findChildIndexCallback: (Key key) {
            if (key is ValueKey<int>) return key.value;
            return null;
          },
        ),
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
          min: DateTime(2023, 2, 27),
          max: DateTime(2023, 5, 31),
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
