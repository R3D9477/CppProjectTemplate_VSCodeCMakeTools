#include "somelib.hpp"

#include "gtest/gtest.h"

class SomeLibTest_GTest: public ::testing::Test
{
};

TEST_F(SomeLibTest_GTest, FirstCase)
{
    //...
    //...
    //...

    ASSERT_TRUE(true);
}
