Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B7AC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:04:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14449.1683104691804707930
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LCBwc84o;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30644c18072so189479f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 May 2023 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104690; x=1685696690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4sNfdgrT1qb9Zz1I5XNdkYABlngYsVbAYppzPa+hbE=;
        b=LCBwc84oZMJhrmM8FD7BPzS8gCX6ZuvoppBnQct/4sQrh3405r6bwajItrSdU9K6Mi
         hs6xv/n4T1nEANJ8Dy2k8JpTSHeOTp0H5HbOVVVXkOB6S8x70n6L5v2LZM2bLOkMAd5V
         WoUQFSzqHzjbxmvL1YxB2bG6+nwG3jgjKfrNCUlBIXItqFkA0FPX8ZCmbU+XVYM/OiTg
         LuESfe+AHKXnLjYUFVd+Omgzmy4YbqeHzjB6nobAvgMZVIHex/cwUZ8PgevXN9IFOiei
         cUZWMtasLH+B10yRCfc04nUgpXpG+1k0FxboULWA8U8+YCjO+16m2ibhzaGid7YEIaSF
         AF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104690; x=1685696690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4sNfdgrT1qb9Zz1I5XNdkYABlngYsVbAYppzPa+hbE=;
        b=MMLzdSz5IjDvKExKhnghbuoEXtrYuw0Qin4//kNXSkHgh3i1xQzrZtVJnNHvEQ5Yuv
         mRlaKEdd3lH2gPKEXcfeRBiq3Gg9T6nnxQAL6mOtOARXXo54zB4PJWGI+2a771KSFo8o
         w+/qz4pErP+TS6F+njAhiGOaS58O98x5MXaUsmLI26cBFmFKEj4oUpYlUWqlIsWOSkge
         6ikTDEWRBNgAmFZOSsBNDUHxEX6lOo4shv/sPjawmYF13HlrvbgwXnY5lDKunYD95OGR
         UJZdZYrC2+aVETuvDd8NapFAbYt+onNg0AYAipkmAexVYmtCTVRRsxNpYrs+6VHlMjAh
         viMA==
X-Gm-Message-State: AC+VfDyJylYY0whtM227FeY6eWWKGYpQrawH7PcJ1Pw9BOMweY4fVGQq
	v4VqBk2LKjSqL5cPhcaXhTWgSCqlnUA=
X-Google-Smtp-Source: ACHHUZ6F8MWwDevQiLUexw8lXjvcysXDwPFqSYOiyp7zSXujj4VjlxRq4a0vRgkC4oL/sdBcUfm0UA==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id d15-20020adfef8f000000b002f8e190e719mr14963140wro.65.1683104689952;
        Wed, 03 May 2023 02:04:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z18-20020adfd0d2000000b002fae7408544sm32947482wrh.108.2023.05.03.02.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:04:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] ceph: fix build with gcc-13
Date: Wed,  3 May 2023 11:04:46 +0200
Message-Id: <20230503090446.1149806-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 May 2023 09:04:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8041

* this isn't complete fix as there are still issues from new boost as in:
  https://github.com/boostorg/phoenix/issues/111
  http://errors.yoctoproject.org/Errors/Details/702743/
  TOPDIR/tmp-glibc/work/core2-64-oe-linux/ceph/15.2.15-r0/recipe-sysroot-na=
tive/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-li=
nux/13.1.0/ld: CMakeFiles/common-objs.dir/mon/MonCap.cc.o:/usr/include/boos=
t/preprocessor/iteration/detail/limits/local_256.hpp:43: multiple definitio=
n of `boost::phoenix::placeholders::uarg10'; common/CMakeFiles/common-commo=
n-objs.dir/ConfUtils.cc.o:/usr/include/boost/preprocessor/iteration/detail/=
limits/local_256.hpp:43: first defined here

* probably easiest fix for above would be to upgrade to newer ceph, but
  I'm not using it, so couldn't properly test it (I was just looking
  at bitbake world failures in mickledore

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-with-GCC-13-missing-cstdint-include.patch |  41 +++++++
 ...itVector-NoInitAllocator-with-wrappe.patch | 101 ++++++++++++++++++
 .../0003-librdb-fix-build-with-gcc-13.patch   |  30 ++++++
 recipes-extended/ceph/ceph_15.2.15.bb         |   3 +
 4 files changed, 175 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-common-fix-build-with-G=
CC-13-missing-cstdint-include.patch
 create mode 100644 recipes-extended/ceph/ceph/0002-common-replace-BitVecto=
r-NoInitAllocator-with-wrappe.patch
 create mode 100644 recipes-extended/ceph/ceph/0003-librdb-fix-build-with-g=
cc-13.patch

diff --git a/recipes-extended/ceph/ceph/0001-common-fix-build-with-GCC-13-m=
issing-cstdint-include.patch b/recipes-extended/ceph/ceph/0001-common-fix-b=
uild-with-GCC-13-missing-cstdint-include.patch
new file mode 100644
index 0000000..b6ba82b
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-common-fix-build-with-GCC-13-missing-=
cstdint-include.patch
@@ -0,0 +1,41 @@
+From 59e6b44f7ed4020a860e347322acfdacc6e4560b Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Fri, 28 Oct 2022 16:47:38 +0100
+Subject: [PATCH] common: fix build with GCC 13 (missing <cstdint> include)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed for uint8_t. Only worked by chance before (see
+https://www.gnu.org/software/gcc/gcc-13/porting_to.html).
+
+```
+FAILED: src/CMakeFiles/common-objs.dir/mds/FSMapUser.cc.o
+/usr/bin/x86_64-pc-linux-gnu-g++ -DBOOST_ASIO_DISABLE_THREAD_KEYWORD_EXTEN=
SION -DHAVE_CONFIG_H -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2 -D_GNU_=
SOURCE -D_REENTRANT -D_THREAD_SAFE -D__CEPH__ -D__STDC_FORMAT_MACROS -D__li=
nux__ -I/var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5_build/src=
/include -I/var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5/src -i=
system /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5_build/incl=
ude -isystem /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5/src/=
xxHash -isystem /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5/s=
rc/rapidjson/include  -O2 -march=3Dnative -pipe -fPIC   -U_FORTIFY_SOURCE -=
Wall -fno-strict-aliasing -fsigned-char -Wtype-limits -Wignored-qualifiers =
-Wpointer-arith -Werror=3Dformat-security -Winit-self -Wno-unknown-pragmas =
-Wnon-virtual-dtor -Wno-ignored-qualifiers -ftemplate-depth-1024 -Wpessimiz=
ing-move -Wredundant-move -Wstrict-null-sentinel -Woverloaded-virtual -fno-=
new-ttp-matching -fstack-protector-strong -fdiagnostics-color=3Dauto -fno-b=
uiltin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free -s=
td=3Dc++17 -MD -MT src/CMakeFiles/common-objs.dir/mds/FSMapUser.cc.o -MF sr=
c/CMakeFiles/common-objs.dir/mds/FSMapUser.cc.o.d -o src/CMakeFiles/common-=
objs.dir/mds/FSMapUser.cc.o -c /var/tmp/portage/sys-cluster/ceph-17.2.5/wor=
k/ceph-17.2.5/src/mds/FSMapUser.cc
+In file included from /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-1=
7.2.5/src/log/SubsystemMap.h:12,
+                 from /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-1=
7.2.5/src/common/config.h:23,
+                 from /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-1=
7.2.5/src/mds/mdstypes.h:13,
+                 from /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-1=
7.2.5/src/mds/FSMapUser.h:21,
+                 from /var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-1=
7.2.5/src/mds/FSMapUser.cc:1:
+/var/tmp/portage/sys-cluster/ceph-17.2.5/work/ceph-17.2.5/src/common/subsy=
s_types.h:56:23: error: =E2=80=98uint8_t=E2=80=99 in namespace =E2=80=98std=
=E2=80=99 does not name a type; did you mean =E2=80=98wint_t=E2=80=99?
+```
+
+Bug: https://bugs.gentoo.org/878531
+Signed-off-by: Sam James <sam@gentoo.org>
+Upstream-Status: Backport [https://github.com/ceph/ceph/commit/74794f9d6f5=
c6671438085bdba730b504901a7c0]
+---
+ src/common/subsys_types.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/subsys_types.h b/src/common/subsys_types.h
+index 52171809..bd7cc439 100644
+--- a/src/common/subsys_types.h
++++ b/src/common/subsys_types.h
+@@ -17,6 +17,7 @@
+=20
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+=20
+ enum ceph_subsys_id_t {
+   ceph_subsys_,   // default
diff --git a/recipes-extended/ceph/ceph/0002-common-replace-BitVector-NoIni=
tAllocator-with-wrappe.patch b/recipes-extended/ceph/ceph/0002-common-repla=
ce-BitVector-NoInitAllocator-with-wrappe.patch
new file mode 100644
index 0000000..4f46d22
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0002-common-replace-BitVector-NoInitAlloca=
tor-with-wrappe.patch
@@ -0,0 +1,101 @@
+From cca3144aca7f7c19772065421f9b02205a84e0b8 Mon Sep 17 00:00:00 2001
+From: Casey Bodley <cbodley@redhat.com>
+Date: Tue, 15 Feb 2022 18:27:10 -0500
+Subject: [PATCH] common: replace BitVector::NoInitAllocator with wrapper
+ struct
+
+in c++20, the deprecated `struct std::allocator<T>::rebind` template was
+removed, so `BitVector` no longer compiles. without a `rebind` to
+inherit, `std::allocator_traits<NoInitAllocator>::rebind_alloc<U>` was
+looking for `NoInitAllocator<U>`, but it isn't a template class
+
+further investigation found that in c++17, `vector<__u32, NoInitAllocator>`
+was rebinding this `NoInitAllocator` to `std::allocator<__u32>` and
+preventing the no-init optimization from taking effect
+
+instead of messing with the allocator to avoid zero-initialization, wrap
+each __u32 in a struct whose constructor does not initialize the value
+
+Fixes: https://tracker.ceph.com/issues/54279
+
+Signed-off-by: Casey Bodley <cbodley@redhat.com>
+---
+Fixes:
+http://errors.yoctoproject.org/Errors/Details/701862/
+
+Upstream-Status: Backport [https://github.com/ceph/ceph/commit/4f0ad8aab6b=
21a1fd57a7c1630d298e31b5d9bb6]
+
+ src/common/bit_vector.hpp | 27 +++++++++++----------------
+ 1 file changed, 11 insertions(+), 16 deletions(-)
+
+diff --git a/src/common/bit_vector.hpp b/src/common/bit_vector.hpp
+index 10ee6c3e..9ce3e8b1 100644
+--- a/src/common/bit_vector.hpp
++++ b/src/common/bit_vector.hpp
+@@ -223,23 +223,18 @@ public:
+=20
+   static void generate_test_instances(std::list<BitVector *> &o);
+ private:
+-  struct NoInitAllocator : public std::allocator<__u32> {
+-    NoInitAllocator() {}
+-    NoInitAllocator(const std::allocator<__u32>& alloc)
+-      : std::allocator<__u32>(alloc) {
+-    }
+-
+-    template <class U, class... Args>
+-    void construct(U* p, Args&&... args) const {
+-    }
+-  };
+-
+   bufferlist m_data;
+   uint64_t m_size;
+   bool m_crc_enabled;
+=20
+   mutable __u32 m_header_crc;
+-  mutable std::vector<__u32, NoInitAllocator> m_data_crcs;
++
++  // inhibit value-initialization when used in std::vector
++  struct u32_struct {
++    u32_struct() {}
++    __u32 val;
++  };
++  mutable std::vector<u32_struct> m_data_crcs;
+=20
+   void resize(uint64_t elements, bool zero);
+=20
+@@ -351,7 +346,7 @@ void BitVector<_b>::encode_data(bufferlist& bl, uint64=
_t data_byte_offset,
+=20
+     bufferlist bit;
+     bit.substr_of(m_data, data_byte_offset, len);
+-    m_data_crcs[data_byte_offset / BLOCK_SIZE] =3D bit.crc32c(0);
++    m_data_crcs[data_byte_offset / BLOCK_SIZE].val =3D bit.crc32c(0);
+=20
+     bl.claim_append(bit);
+     data_byte_offset +=3D BLOCK_SIZE;
+@@ -385,7 +380,7 @@ void BitVector<_b>::decode_data(bufferlist::const_iter=
ator& it,
+     bufferlist bit;
+     bit.append(ptr);
+     if (m_crc_enabled &&
+-	m_data_crcs[data_byte_offset / BLOCK_SIZE] !=3D bit.crc32c(0)) {
++	m_data_crcs[data_byte_offset / BLOCK_SIZE].val !=3D bit.crc32c(0)) {
+       throw buffer::malformed_input("invalid data block CRC");
+     }
+     data.append(bit);
+@@ -499,7 +494,7 @@ void BitVector<_b>::encode_data_crcs(bufferlist& bl, u=
int64_t offset,
+   compute_index(offset + length - 1, &index, &shift);
+   uint64_t end_crc_index =3D index / BLOCK_SIZE;
+   while (crc_index <=3D end_crc_index) {
+-    __u32 crc =3D m_data_crcs[crc_index++];
++    __u32 crc =3D m_data_crcs[crc_index++].val;
+     ceph::encode(crc, bl);
+   }
+ }
+@@ -520,7 +515,7 @@ void BitVector<_b>::decode_data_crcs(bufferlist::const=
_iterator& it,
+   while (remaining > 0) {
+     __u32 crc;
+     ceph::decode(crc, it);
+-    m_data_crcs[crc_index++] =3D crc;
++    m_data_crcs[crc_index++].val =3D crc;
+     --remaining;
+   }
+ }
diff --git a/recipes-extended/ceph/ceph/0003-librdb-fix-build-with-gcc-13.p=
atch b/recipes-extended/ceph/ceph/0003-librdb-fix-build-with-gcc-13.patch
new file mode 100644
index 0000000..c27d6f3
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0003-librdb-fix-build-with-gcc-13.patch
@@ -0,0 +1,30 @@
+From 937231991bd7e2cd578cf8cb6c1bedf611c5faef Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 29 Apr 2023 13:47:43 +0200
+Subject: [PATCH] librdb: fix build with gcc-13
+
+* fixes:
+ceph-15.2.15/src/librbd/api/PoolMetadata.h:28:19: error: 'uint64_t' has no=
t bee
+n declared
+ceph/15.2.15-r0/ceph-15.2.15/src/librbd/api/PoolMetadata.cc:133:5: error: =
no declaration matche
+s 'int librbd::api::PoolMetadata<ImageCtxT>::list(librados::v14_2_0::IoCtx=
&, const std::string&, uint64_t, std::map<std::__cxx11::basic_string<cha
+r>, ceph::buffer::v15_2_0::list>*)'
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending
+---
+ src/librbd/api/PoolMetadata.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/librbd/api/PoolMetadata.h b/src/librbd/api/PoolMetadata.h
+index c0a81735..69ab574a 100644
+--- a/src/librbd/api/PoolMetadata.h
++++ b/src/librbd/api/PoolMetadata.h
+@@ -7,6 +7,7 @@
+ #include "include/buffer_fwd.h"
+ #include "include/rados/librados_fwd.hpp"
+=20
++#include <cstdint>
+ #include <map>
+ #include <string>
+=20
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/=
ceph_15.2.15.bb
index 6312fd3..2c5cdf5 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -23,6 +23,9 @@ SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${PV}=
.tar.gz \
            file://0004-kv-rocksdb_cache-implement-methods-required-by-rock=
s.patch \
            file://0005-kv-rocksdb_cache-mark-Shard-const.patch \
            file://0006-rocksdb-build-with-rocksdb-7.y.z.patch \
+           file://0001-common-fix-build-with-GCC-13-missing-cstdint-includ=
e.patch \
+           file://0002-common-replace-BitVector-NoInitAllocator-with-wrapp=
e.patch \
+           file://0003-librdb-fix-build-with-gcc-13.patch \
 "
=20
 SRC_URI[sha256sum] =3D "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d1=
44b7c56700d0bf"
--=20
2.40.1


