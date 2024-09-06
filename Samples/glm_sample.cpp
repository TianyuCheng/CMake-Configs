#include <glm/glm.hpp>

using namespace glm;

int main()
{
    constexpr glm::bvec1 B(true);
    constexpr bool       A = glm::all(B);
    static_assert(A, "GLM: Failed constexpr");

    constexpr glm::bvec1 D(true);
    constexpr bool       C = glm::any(D);
    static_assert(C, "GLM: Failed constexpr");

    return 0;
}
