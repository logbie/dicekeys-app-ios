// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from DiceKeyImageProcessorWrapper.djinni

#import "DKDiceKeyImageProcessorWrapper+Private.h"
#import "DKDiceKeyImageProcessorWrapper.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface DKDiceKeyImageProcessorWrapper ()

- (id)initWithCpp:(const std::shared_ptr<::dicekeys::DiceKeyImageProcessorWrapper>&)cppRef;

@end

@implementation DKDiceKeyImageProcessorWrapper {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::dicekeys::DiceKeyImageProcessorWrapper>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::dicekeys::DiceKeyImageProcessorWrapper>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

+ (nullable DKDiceKeyImageProcessorWrapper *)create {
    try {
        auto objcpp_result_ = ::dicekeys::DiceKeyImageProcessorWrapper::create();
        return ::djinni_generated::DiceKeyImageProcessorWrapper::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (BOOL)processRGBAImage:(int32_t)width
                  height:(int32_t)height
                   bytes:(nonnull NSData *)bytes {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->processRGBAImage(::djinni::I32::toCpp(width),
                                                                    ::djinni::I32::toCpp(height),
                                                                    ::djinni::Binary::toCpp(bytes));
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (BOOL)processRGBAImageAndRenderOverlay:(int32_t)width
                                  height:(int32_t)height
                                   bytes:(nonnull NSData *)bytes {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->processRGBAImageAndRenderOverlay(::djinni::I32::toCpp(width),
                                                                                    ::djinni::I32::toCpp(height),
                                                                                    ::djinni::Binary::toCpp(bytes));
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (BOOL)processAndAugmentRGBAImage:(int32_t)width
                            height:(int32_t)height
                             bytes:(nonnull NSData *)bytes {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->processAndAugmentRGBAImage(::djinni::I32::toCpp(width),
                                                                              ::djinni::I32::toCpp(height),
                                                                              ::djinni::Binary::toCpp(bytes));
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSString *)readJson {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->readJson();
        return ::djinni::String::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (BOOL)isFinished {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->isFinished();
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSData *)getFaceImage:(int32_t)faceIndex
                          height:(int32_t)height
                           bytes:(nonnull NSData *)bytes {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getFaceImage(::djinni::I32::toCpp(faceIndex),
                                                                ::djinni::I32::toCpp(height),
                                                                ::djinni::Binary::toCpp(bytes));
        return ::djinni::Binary::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto DiceKeyImageProcessorWrapper::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto DiceKeyImageProcessorWrapper::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<DKDiceKeyImageProcessorWrapper>(cpp);
}

}  // namespace djinni_generated

@end
