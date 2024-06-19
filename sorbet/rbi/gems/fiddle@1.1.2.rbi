# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `fiddle` gem.
# Please instead update this file by running `bin/tapioca gem fiddle`.


module Fiddle
  private

  # call-seq: dlopen(library) => Fiddle::Handle
  #
  # Creates a new handler that opens +library+, and returns an instance of
  # Fiddle::Handle.
  #
  # If +nil+ is given for the +library+, Fiddle::Handle::DEFAULT is used, which
  # is the equivalent to RTLD_DEFAULT. See <code>man 3 dlopen</code> for more.
  #
  #   lib = Fiddle.dlopen(nil)
  #
  # The default is dependent on OS, and provide a handle for all libraries
  # already loaded. For example, in most cases you can use this to access
  # +libc+ functions, or ruby functions like +rb_str_new+.
  #
  # See Fiddle::Handle.new for more.
  #
  # source://fiddle//fiddle.rb#60
  def dlopen(library); end

  class << self
    # call-seq: dlopen(library) => Fiddle::Handle
    #
    # Creates a new handler that opens +library+, and returns an instance of
    # Fiddle::Handle.
    #
    # If +nil+ is given for the +library+, Fiddle::Handle::DEFAULT is used, which
    # is the equivalent to RTLD_DEFAULT. See <code>man 3 dlopen</code> for more.
    #
    #   lib = Fiddle.dlopen(nil)
    #
    # The default is dependent on OS, and provide a handle for all libraries
    # already loaded. For example, in most cases you can use this to access
    # +libc+ functions, or ruby functions like +rb_str_new+.
    #
    # See Fiddle::Handle.new for more.
    #
    # source://fiddle//fiddle.rb#60
    def dlopen(library); end

    # Returns the last +Error+ of the current executing +Thread+ or nil if none
    #
    # source://fiddle//fiddle.rb#35
    def last_error; end

    # Sets the last +Error+ of the current executing +Thread+ to +error+
    #
    # source://fiddle//fiddle.rb#40
    def last_error=(error); end
  end
end

# A mixin that provides methods for parsing C struct and prototype signatures.
#
# == Example
#   require 'fiddle/import'
#
#   include Fiddle::CParser
#     #=> Object
#
#   parse_ctype('int')
#     #=> Fiddle::TYPE_INT
#
#   parse_struct_signature(['int i', 'char c'])
#     #=> [[Fiddle::TYPE_INT, Fiddle::TYPE_CHAR], ["i", "c"]]
#
#   parse_signature('double sum(double, double)')
#     #=> ["sum", Fiddle::TYPE_DOUBLE, [Fiddle::TYPE_DOUBLE, Fiddle::TYPE_DOUBLE]]
module Fiddle::CParser
  # Given a String of C type +ty+, returns the corresponding Fiddle constant.
  #
  # +ty+ can also accept an Array of C type Strings, and will be returned in
  # a corresponding Array.
  #
  # If Hash +tymap+ is provided, +ty+ is expected to be the key, and the
  # value will be the C type to be looked up.
  #
  # Example:
  #   require 'fiddle/import'
  #
  #   include Fiddle::CParser
  #     #=> Object
  #
  #   parse_ctype('int')
  #     #=> Fiddle::TYPE_INT
  #
  #   parse_ctype('double diff')
  #     #=> Fiddle::TYPE_DOUBLE
  #
  #   parse_ctype('unsigned char byte')
  #     #=> -Fiddle::TYPE_CHAR
  #
  #   parse_ctype('const char* const argv[]')
  #     #=> -Fiddle::TYPE_VOIDP
  #
  # source://fiddle//fiddle/cparser.rb#149
  def parse_ctype(ty, tymap = T.unsafe(nil)); end

  # Parses a C prototype signature
  #
  # If Hash +tymap+ is provided, the return value and the arguments from the
  # +signature+ are expected to be keys, and the value will be the C type to
  # be looked up.
  #
  # Example:
  #   require 'fiddle/import'
  #
  #   include Fiddle::CParser
  #     #=> Object
  #
  #   parse_signature('double sum(double, double)')
  #     #=> ["sum", Fiddle::TYPE_DOUBLE, [Fiddle::TYPE_DOUBLE, Fiddle::TYPE_DOUBLE]]
  #
  #   parse_signature('void update(void (*cb)(int code))')
  #     #=> ["update", Fiddle::TYPE_VOID, [Fiddle::TYPE_VOIDP]]
  #
  #   parse_signature('char (*getbuffer(void))[80]')
  #     #=> ["getbuffer", Fiddle::TYPE_VOIDP, []]
  #
  # source://fiddle//fiddle/cparser.rb#109
  def parse_signature(signature, tymap = T.unsafe(nil)); end

  # Parses a C struct's members
  #
  # Example:
  #   require 'fiddle/import'
  #
  #   include Fiddle::CParser
  #     #=> Object
  #
  #   parse_struct_signature(['int i', 'char c'])
  #     #=> [[Fiddle::TYPE_INT, Fiddle::TYPE_CHAR], ["i", "c"]]
  #
  #   parse_struct_signature(['char buffer[80]'])
  #     #=> [[[Fiddle::TYPE_CHAR, 80]], ["buffer"]]
  #
  # source://fiddle//fiddle/cparser.rb#35
  def parse_struct_signature(signature, tymap = T.unsafe(nil)); end

  private

  # source://fiddle//fiddle/cparser.rb#273
  def compact(signature); end

  # source://fiddle//fiddle/cparser.rb#268
  def split_arguments(arguments, sep = T.unsafe(nil)); end
end

# A base class for objects representing a C structure
class Fiddle::CStruct
  include ::Enumerable

  # source://fiddle//fiddle/struct.rb#68
  def each; end

  # source://fiddle//fiddle/struct.rb#76
  def each_pair; end

  # source://fiddle//fiddle/struct.rb#92
  def replace(another); end

  # source://fiddle//fiddle/struct.rb#84
  def to_h; end

  private

  # source://fiddle//fiddle/struct.rb#110
  def unstruct(value); end

  class << self
    # accessor to Fiddle::CStructEntity
    #
    # source://fiddle//fiddle/struct.rb#12
    def entity_class; end

    # source://fiddle//fiddle/struct.rb#16
    def offsetof(name, members, types); end
  end
end

# Used to construct C classes (CUnion, CStruct, etc)
#
# Fiddle::Importer#struct and Fiddle::Importer#union wrap this functionality in an
# easy-to-use manner.
module Fiddle::CStructBuilder
  private

  # Construct a new class given a C:
  # * class +klass+ (CUnion, CStruct, or other that provide an
  #   #entity_class)
  # * +types+ (Fiddle::TYPE_INT, Fiddle::TYPE_SIZE_T, etc., see the C types
  #   constants)
  # * corresponding +members+
  #
  # Fiddle::Importer#struct and Fiddle::Importer#union wrap this functionality in an
  # easy-to-use manner.
  #
  # Examples:
  #
  #   require 'fiddle/struct'
  #   require 'fiddle/cparser'
  #
  #   include Fiddle::CParser
  #
  #   types, members = parse_struct_signature(['int i','char c'])
  #
  #   MyStruct = Fiddle::CStructBuilder.create(Fiddle::CUnion, types, members)
  #
  #   MyStruct.malloc(Fiddle::RUBY_FREE) do |obj|
  #     ...
  #   end
  #
  #   obj = MyStruct.malloc(Fiddle::RUBY_FREE)
  #   begin
  #     ...
  #   ensure
  #     obj.call_free
  #   end
  #
  #   obj = MyStruct.malloc
  #   begin
  #     ...
  #   ensure
  #     Fiddle.free obj.to_ptr
  #   end
  #
  # source://fiddle//fiddle/struct.rb#215
  def create(klass, types, members); end

  class << self
    # Construct a new class given a C:
    # * class +klass+ (CUnion, CStruct, or other that provide an
    #   #entity_class)
    # * +types+ (Fiddle::TYPE_INT, Fiddle::TYPE_SIZE_T, etc., see the C types
    #   constants)
    # * corresponding +members+
    #
    # Fiddle::Importer#struct and Fiddle::Importer#union wrap this functionality in an
    # easy-to-use manner.
    #
    # Examples:
    #
    #   require 'fiddle/struct'
    #   require 'fiddle/cparser'
    #
    #   include Fiddle::CParser
    #
    #   types, members = parse_struct_signature(['int i','char c'])
    #
    #   MyStruct = Fiddle::CStructBuilder.create(Fiddle::CUnion, types, members)
    #
    #   MyStruct.malloc(Fiddle::RUBY_FREE) do |obj|
    #     ...
    #   end
    #
    #   obj = MyStruct.malloc(Fiddle::RUBY_FREE)
    #   begin
    #     ...
    #   ensure
    #     obj.call_free
    #   end
    #
    #   obj = MyStruct.malloc
    #   begin
    #     ...
    #   ensure
    #     Fiddle.free obj.to_ptr
    #   end
    #
    # source://fiddle//fiddle/struct.rb#215
    def create(klass, types, members); end
  end
end

# A pointer to a C structure
class Fiddle::CStructEntity < ::Fiddle::Pointer
  include ::Fiddle::PackInfo
  include ::Fiddle::ValueUtil

  # Wraps the C pointer +addr+ as a C struct with the given +types+.
  #
  # When the instance is garbage collected, the C function +func+ is called.
  #
  # See also Fiddle::Pointer.new
  #
  # @return [CStructEntity] a new instance of CStructEntity
  #
  # source://fiddle//fiddle/struct.rb#340
  def initialize(addr, types, func = T.unsafe(nil)); end

  # Fetch struct member +name+ if only one argument is specified. If two
  # arguments are specified, the first is an offset and the second is a
  # length and this method returns the string of +length+ bytes beginning at
  # +offset+.
  #
  # Examples:
  #
  #     my_struct = struct(['int id']).malloc
  #     my_struct.id = 1
  #     my_struct['id'] # => 1
  #     my_struct[0, 4] # => "\x01\x00\x00\x00".b
  #
  # source://fiddle//fiddle/struct.rb#413
  def [](*args); end

  # Set struct member +name+, to value +val+. If more arguments are
  # specified, writes the string of bytes to the memory at the given
  # +offset+ and +length+.
  #
  # Examples:
  #
  #     my_struct = struct(['int id']).malloc
  #     my_struct['id'] = 1
  #     my_struct[0, 4] = "\x01\x00\x00\x00".b
  #     my_struct.id # => 1
  #
  # source://fiddle//fiddle/struct.rb#465
  def []=(*args); end

  # Set the names of the +members+ in this C struct
  #
  # source://fiddle//fiddle/struct.rb#349
  def assign_names(members); end

  # Calculates the offsets and sizes for the given +types+ in the struct.
  #
  # source://fiddle//fiddle/struct.rb#375
  def set_ctypes(types); end

  # source://fiddle//fiddle/struct.rb#505
  def to_s; end

  class << self
    # source://fiddle//fiddle/struct.rb#277
    def alignment(types); end

    # Allocates a C struct with the +types+ provided.
    #
    # See Fiddle::Pointer.malloc for memory management issues.
    #
    # source://fiddle//fiddle/struct.rb#293
    def malloc(types, func = T.unsafe(nil), size = T.unsafe(nil), &block); end

    # Returns the offset for the packed sizes for the given +types+.
    #
    #   Fiddle::CStructEntity.size(
    #     [ Fiddle::TYPE_DOUBLE,
    #       Fiddle::TYPE_INT,
    #       Fiddle::TYPE_CHAR,
    #       Fiddle::TYPE_VOIDP ]) #=> 24
    #
    # source://fiddle//fiddle/struct.rb#313
    def size(types); end
  end
end

# A base class for objects representing a C union
class Fiddle::CUnion
  class << self
    # accessor to Fiddle::CUnionEntity
    #
    # source://fiddle//fiddle/struct.rb#127
    def entity_class; end

    # source://fiddle//fiddle/struct.rb#131
    def offsetof(name, members, types); end
  end
end

# A pointer to a C union
class Fiddle::CUnionEntity < ::Fiddle::CStructEntity
  # Calculate the necessary offset and for each union member with the given
  # +types+
  #
  # source://fiddle//fiddle/struct.rb#533
  def set_ctypes(types); end

  class << self
    # Returns the size needed for the union with the given +types+.
    #
    #   Fiddle::CUnionEntity.size(
    #     [ Fiddle::TYPE_DOUBLE,
    #       Fiddle::TYPE_INT,
    #       Fiddle::TYPE_CHAR,
    #       Fiddle::TYPE_VOIDP ]) #=> 8
    #
    # source://fiddle//fiddle/struct.rb#521
    def size(types); end
  end
end

class Fiddle::ClearedReferenceError < ::Fiddle::Error; end

class Fiddle::Closure
  # arguments of the FFI closure
  #
  # source://fiddle//fiddle/closure.rb#34
  def args; end

  # the C type of the return of the FFI closure
  #
  # source://fiddle//fiddle/closure.rb#31
  def ctype; end

  class << self
    # Create a new closure. If a block is given, the created closure
    # is automatically freed after the given block is executed.
    #
    # The all given arguments are passed to Fiddle::Closure.new. So
    # using this method without block equals to Fiddle::Closure.new.
    #
    # == Example
    #
    #   Fiddle::Closure.create(TYPE_INT, [TYPE_INT]) do |closure|
    #     # closure is freed automatically when this block is finished.
    #   end
    #
    # source://fiddle//fiddle/closure.rb#16
    def create(*args); end
  end
end

# Extends Fiddle::Closure to allow for building the closure in a block
class Fiddle::Closure::BlockCaller < ::Fiddle::Closure
  # == Description
  #
  # Construct a new BlockCaller object.
  #
  # * +ctype+ is the C type to be returned
  # * +args+ are passed the callback
  # * +abi+ is the abi of the closure
  #
  # If there is an error in preparing the +ffi_cif+ or +ffi_prep_closure+,
  # then a RuntimeError will be raised.
  #
  # == Example
  #
  #   include Fiddle
  #
  #   cb = Closure::BlockCaller.new(TYPE_INT, [TYPE_INT]) do |one|
  #     one
  #   end
  #
  #   func = Function.new(cb, [TYPE_INT], TYPE_INT)
  #
  # @return [BlockCaller] a new instance of BlockCaller
  #
  # source://fiddle//fiddle/closure.rb#60
  def initialize(ctype, args, abi = T.unsafe(nil), &block); end

  # Calls the constructed BlockCaller, with +args+
  #
  # For an example see Fiddle::Closure::BlockCaller.new
  #
  # source://fiddle//fiddle/closure.rb#69
  def call(*args); end
end

# Used internally by Fiddle::Importer
class Fiddle::CompositeHandler
  # Create a new handler with the open +handlers+
  #
  # Used internally by Fiddle::Importer.dlload
  #
  # @return [CompositeHandler] a new instance of CompositeHandler
  #
  # source://fiddle//fiddle/import.rb#13
  def initialize(handlers); end

  # See Fiddle::CompositeHandler.sym
  #
  # source://fiddle//fiddle/import.rb#40
  def [](symbol); end

  # Array of the currently loaded libraries.
  #
  # source://fiddle//fiddle/import.rb#18
  def handlers; end

  # Returns the address as an Integer from any handlers with the function
  # named +symbol+.
  #
  # Raises a DLError if the handle is closed.
  #
  # source://fiddle//fiddle/import.rb#26
  def sym(symbol); end
end

class Fiddle::Error < ::StandardError; end

class Fiddle::Function
  # The ABI of the Function.
  #
  # source://fiddle//fiddle/function.rb#5
  def abi; end

  # The name of this function
  #
  # source://fiddle//fiddle/function.rb#11
  def name; end

  # Whether GVL is needed to call this function
  #
  # @return [Boolean]
  #
  # source://fiddle//fiddle/function.rb#14
  def need_gvl?; end

  # The address of this function
  #
  # source://fiddle//fiddle/function.rb#8
  def ptr; end

  # The integer memory location of this function
  #
  # source://fiddle//fiddle/function.rb#19
  def to_i; end

  # Turn this function in to a proc
  #
  # source://fiddle//fiddle/function.rb#24
  def to_proc; end
end

# A DSL that provides the means to dynamically load libraries and build
# modules around them including calling extern functions within the C
# library that has been loaded.
#
# == Example
#
#   require 'fiddle'
#   require 'fiddle/import'
#
#   module LibSum
#   	extend Fiddle::Importer
#   	dlload './libsum.so'
#   	extern 'double sum(double*, int)'
#   	extern 'double split(double)'
#   end
module Fiddle::Importer
  include ::Fiddle
  include ::Fiddle::CParser
  extend ::Fiddle
  extend ::Fiddle::CParser
  extend ::Fiddle::Importer

  # Returns the function mapped to +name+, that was created by either
  # Fiddle::Importer.extern or Fiddle::Importer.bind
  #
  # source://fiddle//fiddle/import.rb#237
  def [](name); end

  # Creates a global method from the given C +signature+ using the given
  # +opts+ as bind parameters with the given block.
  #
  # source://fiddle//fiddle/import.rb#193
  def bind(signature, *opts, &blk); end

  # Returns a new closure wrapper for the +name+ function.
  #
  # * +ctype+ is the return type of the function
  # * +argtype+ is an Array of arguments, passed to the callback function
  # * +call_type+ is the abi of the closure
  # * +block+ is passed to the callback
  #
  # See Fiddle::Closure
  #
  # source://fiddle//fiddle/import.rb#313
  def bind_function(name, ctype, argtype, call_type = T.unsafe(nil), &block); end

  # Creates a class to wrap the C struct with the value +ty+
  #
  # See also Fiddle::Importer.struct
  #
  # source://fiddle//fiddle/import.rb#244
  def create_value(ty, val = T.unsafe(nil)); end

  # Creates an array of handlers for the given +libs+, can be an instance of
  # Fiddle::Handle, Fiddle::Importer, or will create a new instance of
  # Fiddle::Handle using Fiddle.dlopen
  #
  # Raises a DLError if the library cannot be loaded.
  #
  # See Fiddle.dlopen
  #
  # source://fiddle//fiddle/import.rb#76
  def dlload(*libs); end

  # Creates a global method from the given C +signature+.
  #
  # source://fiddle//fiddle/import.rb#169
  def extern(signature, *opts); end

  # The Fiddle::CompositeHandler instance
  #
  # Will raise an error if no handlers are open.
  #
  # source://fiddle//fiddle/import.rb#266
  def handler; end

  # Returns a new Fiddle::Function instance at the memory address of the given
  # +name+ function.
  #
  # Raises a DLError if the +name+ doesn't exist.
  #
  # * +argtype+ is an Array of arguments, passed to the +name+ function.
  # * +ctype+ is the return type of the function
  # * +call_type+ is the ABI of the function
  #
  # See also Fiddle:Function.new
  #
  # See Fiddle::CompositeHandler.sym and Fiddle::Handler.sym
  #
  # source://fiddle//fiddle/import.rb#296
  def import_function(name, ctype, argtype, call_type = T.unsafe(nil)); end

  # Returns a new Fiddle::Pointer instance at the memory address of the given
  # +name+ symbol.
  #
  # Raises a DLError if the +name+ doesn't exist.
  #
  # See Fiddle::CompositeHandler.sym and Fiddle::Handle.sym
  #
  # source://fiddle//fiddle/import.rb#276
  def import_symbol(name); end

  # Returns a new instance of the C struct with the value +ty+ at the +addr+
  # address.
  #
  # source://fiddle//fiddle/import.rb#256
  def import_value(ty, addr); end

  # Returns the sizeof +ty+, using Fiddle::Importer.parse_ctype to determine
  # the C type and the appropriate Fiddle constant.
  #
  # source://fiddle//fiddle/import.rb#101
  def sizeof(ty); end

  # Creates a class to wrap the C struct described by +signature+.
  #
  #   MyStruct = struct ['int i', 'char c']
  #
  # source://fiddle//fiddle/import.rb#222
  def struct(signature); end

  # Sets the type alias for +alias_type+ as +orig_type+
  #
  # source://fiddle//fiddle/import.rb#95
  def typealias(alias_type, orig_type); end

  # Creates a class to wrap the C union described by +signature+.
  #
  #   MyUnion = union ['int i', 'char c']
  #
  # source://fiddle//fiddle/import.rb#230
  def union(signature); end

  # Creates a class to wrap the C struct with the value +ty+
  #
  # See also Fiddle::Importer.struct
  #
  # source://fiddle//fiddle/import.rb#244
  def value(ty, val = T.unsafe(nil)); end

  private

  # source://fiddle//fiddle/import.rb#140
  def parse_bind_options(opts); end

  # Returns the value of attribute type_alias.
  #
  # source://fiddle//fiddle/import.rb#66
  def type_alias; end
end

# :stopdoc:
#
# source://fiddle//fiddle/import.rb#158
Fiddle::Importer::CALL_TYPE_TO_ABI = T.let(T.unsafe(nil), Hash)

class Fiddle::MemoryView
  def initialize(_arg0); end

  def [](*_arg0); end
  def byte_size; end
  def format; end
  def item_size; end
  def ndim; end
  def obj; end
  def readonly?; end
  def release; end
  def shape; end
  def strides; end
  def sub_offsets; end
  def to_s; end

  class << self
    def export(_arg0); end
  end
end

module Fiddle::PackInfo
  private

  # source://fiddle//fiddle/pack.rb#67
  def align(addr, align); end

  class << self
    # source://fiddle//fiddle/pack.rb#67
    def align(addr, align); end
  end
end

# source://fiddle//fiddle/pack.rb#6
Fiddle::PackInfo::ALIGN_MAP = T.let(T.unsafe(nil), Hash)

# source://fiddle//fiddle/pack.rb#21
Fiddle::PackInfo::PACK_MAP = T.let(T.unsafe(nil), Hash)

# source://fiddle//fiddle/pack.rb#45
Fiddle::PackInfo::SIZE_MAP = T.let(T.unsafe(nil), Hash)

class Fiddle::Packer
  include ::Fiddle::PackInfo

  # @return [Packer] a new instance of Packer
  #
  # source://fiddle//fiddle/pack.rb#85
  def initialize(types); end

  # source://fiddle//fiddle/pack.rb#93
  def pack(ary); end

  # source://fiddle//fiddle/pack.rb#89
  def size; end

  # source://fiddle//fiddle/pack.rb#107
  def unpack(ary); end

  private

  # source://fiddle//fiddle/pack.rb#123
  def parse_types(types); end

  class << self
    # source://fiddle//fiddle/pack.rb#81
    def [](*types); end
  end
end

class Fiddle::Pinned
  def initialize(_arg0); end

  def clear; end
  def cleared?; end
  def ref; end
end

# Add constants for backwards compat
#
# source://fiddle//fiddle.rb#96
Fiddle::RTLD_GLOBAL = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#97
Fiddle::RTLD_LAZY = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#98
Fiddle::RTLD_NOW = T.let(T.unsafe(nil), Integer)

# Wrapper for arrays within a struct
class Fiddle::StructArray < ::Array
  include ::Fiddle::ValueUtil

  # @return [StructArray] a new instance of StructArray
  #
  # source://fiddle//fiddle/struct.rb#140
  def initialize(ptr, type, initial_values); end

  # source://fiddle//fiddle/struct.rb#157
  def []=(index, value); end

  # source://fiddle//fiddle/struct.rb#153
  def to_ptr; end
end

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_BOOL = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_CONST_STRING = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_INT16_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_INT32_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_INT64_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_INT8_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UCHAR = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UINT = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UINT16_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UINT32_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UINT64_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_UINT8_T = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_ULONG = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_ULONG_LONG = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_USHORT = T.let(T.unsafe(nil), Integer)

# source://fiddle//fiddle.rb#101
Fiddle::TYPE_VARIADIC = T.let(T.unsafe(nil), Integer)

module Fiddle::Types; end

# source://fiddle//fiddle/version.rb#2
Fiddle::VERSION = T.let(T.unsafe(nil), String)

module Fiddle::ValueUtil
  # source://fiddle//fiddle/value.rb#26
  def signed_value(val, ty); end

  # source://fiddle//fiddle/value.rb#6
  def unsigned_value(val, ty); end

  # source://fiddle//fiddle/value.rb#55
  def wrap_arg(arg, ty, funcs = T.unsafe(nil), &block); end

  # source://fiddle//fiddle/value.rb#46
  def wrap_args(args, tys, funcs, &block); end
end
