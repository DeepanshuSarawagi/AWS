# Versioning in AWS S3

- This allows us to have multiple versions of a S3 objects.
- It will also allow us to recover from versioning if the object is subjected to
  accidental deletion.
- The old version of objects can be moved to different storage class should we
  need to.
- Versioning once enabled, cannot be disabled. It is not enabled by default.
- Instead versioning can be suspended, it will only prevent us from creating versions
  of objects.
- Any file that hasn't been versioned prior to enabling versioning will have version null.