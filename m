Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.4134.1631827389142423729
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 14:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XJXWgNB3;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id il14-20020a17090b164e00b0019c7a7c362dso2232138pjb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/PceftYYH2KZpp98wkbYEQn2mWILE2kLx7M2B8XZvI=;
        b=XJXWgNB3PK6TqUYLL28bK068J/3Y9vCLPHXfXUxE4190iLrWYwDi5/HT96mRd41BWH
         FZ/8kOU+07zkUWvvDcksvebiZkzylOKPBeqH7Pkg+T+A9kruMgYqD6aIE2HWkZ1KmQc9
         4qNIbk5XhLwgQJUQrq66J3R27Rm4dDn0gcXV6HxF5VYJ+GZ/ul2YcjqlvSaUWuTk5OrJ
         GgMUcJ31Rx0o/CkQ4227xa9shcSeC6V8xzfQ0NieQ4frWywljHCSbq9mjPPgh9WaJs08
         GJOredARXEswG+aP6DmUA20KLnOSu3n/QuG5mNT8l9ttkPaqMPVmHCOC1BIKjjoGGS14
         b12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/PceftYYH2KZpp98wkbYEQn2mWILE2kLx7M2B8XZvI=;
        b=j1LLnPpHRt2ZtI7qoiuSFFFH58wEyJF2/nHpRbTwFtX8ZccjoHRPbyTZKJpJmOREEe
         r046OPXCfFKAw91oqJtsFxxtuZg6GbsvtavuY4gZ6MJnRoaOu4Kf8DIH+uI4nb7lwyZb
         x3HXGz6w1lwavto8MW4q974wwzEMiGDIst9C6zhLOZteedOLLfJRy87bkoqaB5bqn/PO
         3OCRMpbGHvC3Ok2fA3wTXZlI9ruDVah5AlPqcphsBC7nhAoJPeQMugedutPwko1GRfnW
         IB4bu+UjiS4BHMtRATtzOrBEEinjItvW/6Qop0ydNQacH3olouT/vzOvbYH4sLqx3TDj
         KYcQ==
X-Gm-Message-State: AOAM5318L5AKuT5tpj6Rh13JHSdeWC6UPHFw4s1+VuEPo54j1TYqgosq
	E2WmpsIlTTnc4mnW+SNjeFcslz/MqE8=
X-Google-Smtp-Source: ABdhPJykTMv15dCizNLTrh262UCT0Bw+ZmsTHUNZTF9YTrraGls9a9CYwAaIltMU/56MDfN/Me4AQA==
X-Received: by 2002:a17:90a:af8f:: with SMTP id w15mr16895698pjq.93.1631827388408;
        Thu, 16 Sep 2021 14:23:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id qe17sm3520209pjb.39.2021.09.16.14.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:23:08 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH 2/3] libvirt: Security fix for CVE-2020-25637
Date: Thu, 16 Sep 2021 14:23:04 -0700
Message-Id: <20210916212305.2211766-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916212305.2211766-1-akuster808@gmail.com>
References: <20210916212305.2211766-1-akuster808@gmail.com>
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
 recipes-extended/libvirt/libvirt_6.1.0.bb     |   4 +
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
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index 0146c6c..aa7563f 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -41,6 +41,10 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://hook_support.py \
            file://gnutls-helper.py \
            file://CVE-2020-10701.patch \
+           file://CVE-2020-25637_1.patch \
+           file://CVE-2020-25637_2.patch \
+           file://CVE-2020-25637_3.patch \
+           file://CVE-2020-25637_4.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
-- 
2.25.1

