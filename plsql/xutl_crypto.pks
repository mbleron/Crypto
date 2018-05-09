create or replace package xutl_crypto is
/* ======================================================================================

  MIT License

  Copyright (c) 2018 Marc Bleron

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

=========================================================================================
    Change history :
    Marc Bleron       2018-05-01     Creation
====================================================================================== */
    
  PAD_NONE     constant pls_integer := 0;
  PAD_ZERO     constant pls_integer := 1;
  PAD_PKCS7    constant pls_integer := 2;
  
  CHAIN_ECB    constant pls_integer := 16; -- Electronic Codebook
  CHAIN_CBC    constant pls_integer := 32; -- Cipher Block Chaining
  CHAIN_CFB    constant pls_integer := 48; -- Cipher Feedback
  CHAIN_OFB    constant pls_integer := 64; -- Output Feedback
  
  invalid_key_size     exception;
  pragma exception_init(invalid_key_size, -20750);
  
  invalid_cipher_mode  exception;
  pragma exception_init(invalid_cipher_mode, -20751);
  
  invalid_init_vector  exception;
  pragma exception_init(invalid_init_vector, -20752);

  -- https://tools.ietf.org/html/rfc2898
  function PBKDF2 (
    PRF       in pls_integer
  , password  in raw
  , salt      in raw
  , c         in pls_integer
  , dkLen     in pls_integer
  )
  return raw;
  
  function Blowfish_encrypt (
    src  in blob
  , typ  in pls_integer
  , key  in raw
  , iv   in raw default null
  )
  return blob;
  
  function Blowfish_decrypt (
    src  in blob
  , typ  in pls_integer
  , key  in raw
  , iv   in raw default null
  )
  return blob;

end xutl_crypto;
/
