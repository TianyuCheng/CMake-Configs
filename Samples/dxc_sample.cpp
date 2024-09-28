#include <d3d12.h>
#include <dxcapi.h>
#include <iostream>
#include <wrl/client.h>

// Helper for safe COM object management
using Microsoft::WRL::ComPtr;

// Utility function to print compiler errors
void PrintErrors(IDxcBlob* pErrorBlob)
{
    if (pErrorBlob) {
        const char* errorString = (const char*)pErrorBlob->GetBufferPointer();
        std::cerr << "Shader compilation errors:\n"
                  << errorString << std::endl;
    }
}

int main()
{
    // HLSL shader source code
    const char* shaderSource = R"(
        float4 main() : SV_Target {
            return float4(1.0, 0.0, 0.0, 1.0); // Red color
        }
    )";

    // Initialize DXC
    ComPtr<IDxcLibrary>  pLibrary;
    ComPtr<IDxcCompiler> pCompiler;

    // Create DXC Library
    if (FAILED(DxcCreateInstance(CLSID_DxcLibrary, IID_PPV_ARGS(&pLibrary)))) {
        std::cerr << "Failed to create DXC Library instance." << std::endl;
        return 1;
    }

    // Create DXC Compiler
    if (FAILED(DxcCreateInstance(CLSID_DxcCompiler, IID_PPV_ARGS(&pCompiler)))) {
        std::cerr << "Failed to create DXC Compiler instance." << std::endl;
        return 1;
    }

    // Create blob from source code
    ComPtr<IDxcBlobEncoding> pSourceBlob;
    if (FAILED(pLibrary->CreateBlobWithEncodingFromPinned((LPBYTE)shaderSource, (UINT32)strlen(shaderSource), CP_UTF8, &pSourceBlob))) {
        std::cerr << "Failed to create source blob." << std::endl;
        return 1;
    }

    // Compile the shader
    ComPtr<IDxcOperationResult> pResult;
    if (FAILED(pCompiler->Compile(
            pSourceBlob.Get(), // Source blob
            L"example.hlsl",   // File name (can be anything)
            L"main",           // Entry point
            L"ps_6_4",         // Target profile (pixel shader 6.4)
            nullptr, 0,        // Compiler arguments
            nullptr, 0,        // Defines
            nullptr,           // Include handler
            &pResult           // Operation result
            ))) {
        std::cerr << "Failed to start shader compilation." << std::endl;
        return 1;
    }

    // Check if there are any errors
    HRESULT hrStatus;
    if (FAILED(pResult->GetStatus(&hrStatus)) || FAILED(hrStatus)) {
        ComPtr<IDxcBlobEncoding> pError;
        pResult->GetErrorBuffer(&pError);
        PrintErrors(pError.Get());
        return 1;
    }

    // Retrieve compiled shader (bytecode)
    ComPtr<IDxcBlob> pShaderBlob;
    if (FAILED(pResult->GetResult(&pShaderBlob))) {
        std::cerr << "Failed to retrieve compiled shader." << std::endl;
        return 1;
    }

    // Successfully compiled the shader
    std::cout << "Shader compiled successfully! Size: " << pShaderBlob->GetBufferSize() << " bytes" << std::endl;

    // Optionally save or use the bytecode (pShaderBlob->GetBufferPointer())

    return 0;
}
