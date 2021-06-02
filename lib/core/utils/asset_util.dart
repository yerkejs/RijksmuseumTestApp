const ASSET_IMAGES_PATH = "assets/images";

/// Utility class which returns paths of asset resources
abstract class AssetUtil {
  static String getAssetImagePath (String name) => '$ASSET_IMAGES_PATH/$name';
}