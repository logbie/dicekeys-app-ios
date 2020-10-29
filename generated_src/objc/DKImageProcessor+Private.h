// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from DiceKeyImageProcessorWrapper.djinni

#include "ImageProcessor.hpp"
#include <memory>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@class DKImageProcessor;

namespace djinni_generated {

class ImageProcessor
{
public:
    using CppType = std::shared_ptr<::dicekeys::ImageProcessor>;
    using CppOptType = std::shared_ptr<::dicekeys::ImageProcessor>;
    using ObjcType = DKImageProcessor*;

    using Boxed = ImageProcessor;

    static CppType toCpp(ObjcType objc);
    static ObjcType fromCppOpt(const CppOptType& cpp);
    static ObjcType fromCpp(const CppType& cpp) { return fromCppOpt(cpp); }

private:
    class ObjcProxy;
};

}  // namespace djinni_generated
