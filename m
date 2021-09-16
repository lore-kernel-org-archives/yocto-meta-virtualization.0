Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.3988.1631826836005023021
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 14:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LVQERiG4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so8491997pjr.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dMobveXCybSVvjB+fF21BSGhPnvF9Kb8JPNQDQ0/7Ao=;
        b=LVQERiG4xX7UB9mPwmMHdZqFtKPtVv/EobPeeCCT3ItzTqvP2efjgwVUA+jgQFQ79m
         kabESuVLtpFdfSoRopWptClDfbWTtYyF10Ojwa5wdGZeyd1RYLDJjiWav/kbquuOLIX8
         PgpYUfPGa4JOUbv4aDqkWNXWLakSO65ZhaMHzNZMmwb0Con2toyU6VUln8Tyk/GahUx6
         xSuvltF9khJCtRrOvlkwJum7XffbulyBGTTwyqxxFF80SrOVeiOmjTOtlNnVbiTZY/Uw
         8wqPuGWs//3qOV2WcndmZUpyJ7qcrwLp2sJ7NzOQIHZxTwKUFklWTEdUVcKqu9IQ+m4u
         Y9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dMobveXCybSVvjB+fF21BSGhPnvF9Kb8JPNQDQ0/7Ao=;
        b=lHY53lgyg1NpWhASPhZv/4CoNh1U1dZcfDRD8xVX0CuwC5vhl27Xvrf2ZilQQiO7LB
         jbWxquCbbqHtgJqLkG7334S9uNqLuWcL8vVN7PkNQp5D0ax99v9ZHLLAGPcz45Vueoq1
         G6HWZpj4rlzZOpQB061PJh3GGXO4/L8DT6CEyb4iP24KUdIt8L3UvDDW5koXU4V6KZfw
         EKUyvEm46CVykXtTS1e5EE0vKC7dz0HnnuFOhDd0TDAH2YCpwK4FHkvHktbBc+xVaWaW
         GxxaLXm3mz9fdi3NVYO/AQRusIjKs3WZ22GvCpXXjjneUKVPmbtd5cP12jIWqtxY4k89
         2pzQ==
X-Gm-Message-State: AOAM532vN1LO2OtMOsEE2tI9+jxrieOnIrGyNKO/ka654aO5meSNU1Sa
	cX9zbBxlN/OZgZv0ic6bjQLTywU0CSc=
X-Google-Smtp-Source: ABdhPJzp1OT0NdKb+QhTLV4Luw+FZi/qFvsjFA92UxXUvlSRiJajvwjXd+ccetTLJ8fvl6Xd7AST4Q==
X-Received: by 2002:a17:90a:384a:: with SMTP id l10mr8193068pjf.168.1631826835132;
        Thu, 16 Sep 2021 14:13:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id a11sm3814967pfo.31.2021.09.16.14.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:13:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][hardknott][PATCH 1/2] libvirt: Security fix for CVE-2020-25637
Date: Thu, 16 Sep 2021 14:13:52 -0700
Message-Id: <20210916211353.2143749-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://libvirt.org/git/libvirt.git
MR: 105864
Type: Security Fix
Disposition: Backport from https://libvirt.org/git/libvirt.git
ChangeID: 99bb9b4fc1b608e4e9a56b9d2308bfa54d9ba33c
Description:

* https://libvirt.org/git/?p=libvirt.git;a=commit;h=955029bd0ad7ef96000f529ac38204a8f4a96401
* https://libvirt.org/git/?p=libvirt.git;a=commit;h=50864dcda191eb35732dbd80fb6ca251a6bba923
* https://libvirt.org/git/?p=libvirt.git;a=commit;h=e4116eaa44cb366b59f7fe98f4b88d04c04970ad
* https://libvirt.org/git/?p=libvirt.git;a=commit;h=a63b48c5ecef077bf0f909a85f453a605600cf05

Affects <= 6.3.0

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libvirt/libvirt/CVE-2020-25637_1.patch    |  49 +++++++++
 .../libvirt/libvirt/CVE-2020-25637_2.patch    | 102 ++++++++++++++++++
 .../libvirt/libvirt/CVE-2020-25637_3.patch    |  36 +++++++
 .../libvirt/libvirt/CVE-2020-25637_4.patch    |  80 ++++++++++++++
 recipes-extended/libvirt/libvirt_6.3.0.bb     |   4 +
 5 files changed, 271 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2020-25637_1.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2020-25637_2.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2020-25637_3.patch
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2020-25637_4.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2020-25637_1.patch b/recipes-extended/libvirt/libvirt/CVE-2020-25637_1.patch
new file mode 100644
index 0000000..362d3d1
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2020-25637_1.patch
@@ -0,0 +1,49 @@
+From 955029bd0ad7ef96000f529ac38204a8f4a96401 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
+Date: Fri, 18 Sep 2020 17:44:56 +0200
+Subject: [PATCH] rpc: gendispatch: handle empty flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2020-25637
+
+Prepare for omission of the <flagname> in remote_protocol.x
+@acl annotations:
+ @acl: <object>:<permission>:<flagname>
+so that we can add more fields after, e.g.:
+ @acl: <object>:<permission>::<field>
+
+Signed-off-by: Ján Tomko <jtomko@redhat.com>
+Reviewed-by: Jiri Denemark <jdenemar@redhat.com>
+
+Upsteam-Status: Backport
+CVE: CVE-2020-25637 dep#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/rpc/gendispatch.pl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: libvirt-6.1.0/src/rpc/gendispatch.pl
+===================================================================
+--- libvirt-6.1.0.orig/src/rpc/gendispatch.pl
++++ libvirt-6.1.0/src/rpc/gendispatch.pl
+@@ -2113,7 +2113,7 @@ elsif ($mode eq "client") {
+                 if ($acl[$i]->{object} ne $acl[0]->{object}) {
+                     die "acl for '$call->{ProcName}' cannot check different objects";
+                 }
+-                if (defined $acl[$i]->{flags}) {
++                if (defined $acl[$i]->{flags} && length $acl[$i]->{flags}) {
+                     $checkflags = 1;
+                 }
+             }
+@@ -2201,7 +2201,7 @@ elsif ($mode eq "client") {
+                     my $method = "virAccessManagerCheck" . $object;
+                     my $space = ' ' x length($method);
+                     print "    if (";
+-                    if (defined $acl->{flags}) {
++                    if (defined $acl->{flags} && length $acl->{flags}) {
+                         my $flags = $acl->{flags};
+                         if ($flags =~ /^\!/) {
+                             $flags = substr $flags, 1;
diff --git a/recipes-extended/libvirt/libvirt/CVE-2020-25637_2.patch b/recipes-extended/libvirt/libvirt/CVE-2020-25637_2.patch
new file mode 100644
index 0000000..58eae3e
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2020-25637_2.patch
@@ -0,0 +1,102 @@
+From 50864dcda191eb35732dbd80fb6ca251a6bba923 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
+Date: Fri, 18 Sep 2020 16:09:25 +0200
+Subject: [PATCH] rpc: add support for filtering @acls by uint params
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2020-25637
+
+Add a new field to @acl annotations for filtering by
+unsigned int parameters.
+
+Signed-off-by: Ján Tomko <jtomko@redhat.com>
+Reviewed-by: Jiri Denemark <jdenemar@redhat.com>
+
+Upsteam-Status: Backport
+CVE: CVE-2020-25637 dep#2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/remote/remote_protocol.x |  3 +++
+ src/rpc/gendispatch.pl       | 21 ++++++++++++++++++++-
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+Index: libvirt-6.1.0/src/remote/remote_protocol.x
+===================================================================
+--- libvirt-6.1.0.orig/src/remote/remote_protocol.x
++++ libvirt-6.1.0/src/remote/remote_protocol.x
+@@ -3805,6 +3805,7 @@ enum remote_procedure {
+      *
+      * - @acl: <object>:<permission>
+      * - @acl: <object>:<permission>:<flagname>
++     * - @acl: <object>:<permission>::<param>:<value>
+      *
+      *   Declare the access control requirements for the API. May be repeated
+      *   multiple times, if multiple rules are required.
+@@ -3814,6 +3815,8 @@ enum remote_procedure {
+      *     <permission> is one of the permissions in access/viraccessperm.h
+      *     <flagname> indicates the rule only applies if the named flag
+      *     is set in the API call
++     *     <param> and <value> can be used to check an unsigned int parameter
++     *     against value
+      *
+      * - @aclfilter: <object>:<permission>
+      *
+Index: libvirt-6.1.0/src/rpc/gendispatch.pl
+===================================================================
+--- libvirt-6.1.0.orig/src/rpc/gendispatch.pl
++++ libvirt-6.1.0/src/rpc/gendispatch.pl
+@@ -2105,10 +2105,12 @@ elsif ($mode eq "client") {
+             my @acl;
+             foreach (@{$acl}) {
+                 my @bits = split /:/;
+-                push @acl, { object => $bits[0], perm => $bits[1], flags => $bits[2] }
++                push @acl, { object => $bits[0], perm => $bits[1], flags => $bits[2],
++                             param => $bits[3], value => $bits[4] }
+             }
+ 
+             my $checkflags = 0;
++            my $paramtocheck = undef;
+             for (my $i = 1 ; $i <= $#acl ; $i++) {
+                 if ($acl[$i]->{object} ne $acl[0]->{object}) {
+                     die "acl for '$call->{ProcName}' cannot check different objects";
+@@ -2116,6 +2118,9 @@ elsif ($mode eq "client") {
+                 if (defined $acl[$i]->{flags} && length $acl[$i]->{flags}) {
+                     $checkflags = 1;
+                 }
++                if (defined $acl[$i]->{param}) {
++                    $paramtocheck = $acl[$i]->{param};
++                }
+             }
+ 
+             my $apiname = $prefix . $call->{ProcName};
+@@ -2151,6 +2156,9 @@ elsif ($mode eq "client") {
+             if ($checkflags) {
+                 push @argdecls, "unsigned int flags";
+             }
++            if (defined $paramtocheck) {
++                push @argdecls, "unsigned int " . $paramtocheck;
++            }
+ 
+             my $ret;
+             my $pass;
+@@ -2211,6 +2219,17 @@ elsif ($mode eq "client") {
+                         }
+                         print "        ";
+                     }
++                    if (defined $acl->{param}) {
++                        my $param = $acl->{param};
++                        my $value = $acl->{value};
++                        if ($value =~ /^\!/) {
++                            $value = substr $value, 1;
++                            print "($param != ($value)) &&\n";
++                        } else {
++                            print "($param == ($value)) &&\n";
++                        }
++                        print "        ";
++                    }
+                     print "(rv = $method(" . join(", ", @argvars, $perm) . ")) <= 0) {\n";
+                     print "        virObjectUnref(mgr);\n";
+                     if ($action eq "Ensure") {
diff --git a/recipes-extended/libvirt/libvirt/CVE-2020-25637_3.patch b/recipes-extended/libvirt/libvirt/CVE-2020-25637_3.patch
new file mode 100644
index 0000000..5a3ba80
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2020-25637_3.patch
@@ -0,0 +1,36 @@
+From a63b48c5ecef077bf0f909a85f453a605600cf05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
+Date: Fri, 18 Sep 2020 17:56:37 +0200
+Subject: [PATCH] qemu: agent: set ifname to NULL after freeing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2020-25637
+
+Signed-off-by: Ján Tomko <jtomko@redhat.com>
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Fixes: 0977b8aa071de550e1a013d35e2c72615e65d520
+Reviewed-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Jiri Denemark <jdenemar@redhat.com>
+
+Upsteam-Status: Backport
+CVE: CVE-2020-25637 dep#3
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/qemu/qemu_agent.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: libvirt-6.1.0/src/qemu/qemu_agent.c
+===================================================================
+--- libvirt-6.1.0.orig/src/qemu/qemu_agent.c
++++ libvirt-6.1.0/src/qemu/qemu_agent.c
+@@ -2186,6 +2186,7 @@ qemuAgentGetInterfaces(qemuAgentPtr mon,
+ 
+         /* Has to be freed for each interface. */
+         virStringListFree(ifname);
++        ifname = NULL;
+ 
+         /* as well as IP address which - moreover -
+          * can be presented multiple times */
diff --git a/recipes-extended/libvirt/libvirt/CVE-2020-25637_4.patch b/recipes-extended/libvirt/libvirt/CVE-2020-25637_4.patch
new file mode 100644
index 0000000..9b802ca
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2020-25637_4.patch
@@ -0,0 +1,80 @@
+From e4116eaa44cb366b59f7fe98f4b88d04c04970ad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
+Date: Fri, 18 Sep 2020 17:54:14 +0200
+Subject: [PATCH] rpc: require write acl for guest agent in
+ virDomainInterfaceAddresses
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2020-25637
+
+Add a requirement for domain:write if source is set to
+VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_AGENT.
+
+Signed-off-by: Ján Tomko <jtomko@redhat.com>
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Reviewed-by: Jiri Denemark <jdenemar@redhat.com>
+
+Upsteam-Status: Backport
+CVE: CVE-2020-25637 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/libxl/libxl_driver.c     | 2 +-
+ src/lxc/lxc_driver.c         | 2 +-
+ src/qemu/qemu_driver.c       | 2 +-
+ src/remote/remote_protocol.x | 1 +
+ 4 files changed, 4 insertions(+), 3 deletions(-)
+
+Index: libvirt-6.1.0/src/libxl/libxl_driver.c
+===================================================================
+--- libvirt-6.1.0.orig/src/libxl/libxl_driver.c
++++ libvirt-6.1.0/src/libxl/libxl_driver.c
+@@ -6331,7 +6331,7 @@ libxlDomainInterfaceAddresses(virDomainP
+     if (!(vm = libxlDomObjFromDomain(dom)))
+         goto cleanup;
+ 
+-    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def) < 0)
++    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def, source) < 0)
+         goto cleanup;
+ 
+     if (virDomainObjCheckActive(vm) < 0)
+Index: libvirt-6.1.0/src/lxc/lxc_driver.c
+===================================================================
+--- libvirt-6.1.0.orig/src/lxc/lxc_driver.c
++++ libvirt-6.1.0/src/lxc/lxc_driver.c
+@@ -1698,7 +1698,7 @@ lxcDomainInterfaceAddresses(virDomainPtr
+     if (!(vm = lxcDomObjFromDomain(dom)))
+         goto cleanup;
+ 
+-    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def) < 0)
++    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def, source) < 0)
+         goto cleanup;
+ 
+     if (virDomainObjCheckActive(vm) < 0)
+Index: libvirt-6.1.0/src/qemu/qemu_driver.c
+===================================================================
+--- libvirt-6.1.0.orig/src/qemu/qemu_driver.c
++++ libvirt-6.1.0/src/qemu/qemu_driver.c
+@@ -21846,7 +21846,7 @@ qemuDomainInterfaceAddresses(virDomainPt
+     if (!(vm = qemuDomainObjFromDomain(dom)))
+         goto cleanup;
+ 
+-    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def) < 0)
++    if (virDomainInterfaceAddressesEnsureACL(dom->conn, vm->def, source) < 0)
+         goto cleanup;
+ 
+     if (virDomainObjCheckActive(vm) < 0)
+Index: libvirt-6.1.0/src/remote/remote_protocol.x
+===================================================================
+--- libvirt-6.1.0.orig/src/remote/remote_protocol.x
++++ libvirt-6.1.0/src/remote/remote_protocol.x
+@@ -6211,6 +6211,7 @@ enum remote_procedure {
+     /**
+      * @generate: none
+      * @acl: domain:read
++     * @acl: domain:write::source:VIR_DOMAIN_INTERFACE_ADDRESSES_SRC_AGENT
+      */
+     REMOTE_PROC_DOMAIN_INTERFACE_ADDRESSES = 353,
+ 
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
index eeb1bf8..fc2b63d 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -40,6 +40,10 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-build-drop-unnecessary-libgnu.la-reference.patch \
            file://hook_support.py \
            file://gnutls-helper.py \
+           file://CVE-2020-25637_1.patch \
+           file://CVE-2020-25637_2.patch \
+           file://CVE-2020-25637_3.patch \
+           file://CVE-2020-25637_4.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
-- 
2.25.1

