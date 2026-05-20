#include <ktx.h>
#include <iostream>

int main()
{
    ktxTexture2*         texture = nullptr;
    KTX_error_code       result;
    ktxTextureCreateInfo createInfo;

    createInfo.glInternalformat = 0x8051; // GL_RGB8
    createInfo.vkFormat         = 0;
    createInfo.pDfd             = nullptr;
    createInfo.baseWidth        = 1;
    createInfo.baseHeight       = 1;
    createInfo.baseDepth        = 1;
    createInfo.numDimensions    = 2;
    createInfo.numLevels        = 1;
    createInfo.numLayers        = 0;
    createInfo.numFaces         = 1;
    createInfo.isArray          = KTX_FALSE;
    createInfo.generateMipmaps  = KTX_FALSE;

    result = ktxTexture2_Create(&createInfo, KTX_TEXTURE_CREATE_ALLOC_STORAGE, &texture);
    if (result != KTX_SUCCESS) {
        std::cerr << "Failed to create ktxTexture: " << ktxErrorString(result) << std::endl;
        return 1;
    }

    uint8_t imageData[] = {255, 0, 0}; // Red pixel

    result = ktxTexture_SetImageFromMemory(ktxTexture(texture), 0, 0, 0, imageData, sizeof(imageData));
    if (result != KTX_SUCCESS) {
        std::cerr << "Failed to set image from memory: " << ktxErrorString(result) << std::endl;
        ktxTexture_Destroy(ktxTexture(texture));
        return 1;
    }

    result = ktxTexture_WriteToNamedFile(ktxTexture(texture), "red.ktx");
    if (result != KTX_SUCCESS) {
        std::cerr << "Failed to write texture to file: " << ktxErrorString(result) << std::endl;
        ktxTexture_Destroy(ktxTexture(texture));
        return 1;
    }

    std::cout << "Texture created and saved to red.ktx" << std::endl;

    ktxTexture_Destroy(ktxTexture(texture));

    return 0;
}
