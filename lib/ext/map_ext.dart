extension CopyMap<K,V> on Map<K,V> {

  Map<K,V> copy() {
    return Map.from(this);
  }

}