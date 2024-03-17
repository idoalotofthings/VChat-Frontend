extension RunIf<T> on T {
  T applyIf(bool condition, T Function(T) block) {
    return condition ? block(this) : this;
  }  
}