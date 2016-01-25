module Ethon
  module Curl
    callback :callback, [:pointer, :size_t, :size_t, :pointer], :size_t
    callback :debug_callback, [:pointer, :debug_info_type, :pointer, :size_t, :pointer], :int
    ffi_lib_flags :now, :global

    # OS X el Capitan's System Integrity Protection (SIP) doesn't allow the use of ENV vars such as DYLD_LIBRARY_PATH,
    # which previously could be used by dlopen() to find a different version of curl for Ethon to use.
    #
    # Therefore, for developers who want to use a non-system version of curl, we need to provide our own such ENV var
    #
    # The value should be a full path to the file (not just a dir name)
    ffi_lib [ENV['ETHON_CURL_LIBFILE'], 'libcurl', 'libcurl.so.4']
  end
end
