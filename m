Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC67EE00C1B; Fri, 13 Apr 2018 12:55:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8E15E00B65
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Apr 2018 12:55:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3DJtY8S031871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Apr 2018 12:55:34 -0700
Received: from server.local (128.224.22.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 12:55:33 -0700
To: Yi Zhao <yi.zhao@windriver.com>, <meta-virtualization@yoctoproject.org>,
	<mark.asselstine@windriver.com>
References: <1523579301-24011-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4ce0ebc2-3583-3ac6-e74c-6e128bdcc3ca@windriver.com>
Date: Fri, 13 Apr 2018 15:55:32 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523579301-24011-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [meta-cloud-services][PATCH] glusterfs: refresh patches to fix QA warning
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2018 19:55:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 2018-04-12 8:28 PM, Yi Zhao wrote:
> Refresh patches with devtool command to fix do_patch warning.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...c-allow-PYTHON-values-to-be-passed-via-en.patch | 12 +++++------
>   .../dependence-on-correct-header-file-path.patch   | 12 +++++------
>   .../files/glusterd-change-port-range.patch         |  9 +++++----
>   ...fs-api-remove-unnecessary-library-options.patch |  6 ++----
>   .../glusterfs-change-default-nfs-port-number.patch |  9 +++++----
>   ...onfigure-automake-with-subdir-objects-for.patch |  8 +++-----
>   ...glusterfs-disable-default-startup-scripts.patch |  9 ++++++---
>   .../libglusterfs-Don-t-link-against-libfl.patch    | 12 +++++------
>   ...python-work-around-host-and-target-python.patch |  8 +++-----
>   .../files/xlator-host-contamination-3.4.patch      | 23 +++++++++++++---------
>   10 files changed, 53 insertions(+), 55 deletions(-)
> 
> diff --git a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> index a33ffce..e146f7d 100644
> --- a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> +++ b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> @@ -1,4 +1,4 @@
> -From d535a5448191d433e328b0a25a0710da203c44e7 Mon Sep 17 00:00:00 2001
> +From ff524f14ba93eb422963c8009a108516639d9b3a Mon Sep 17 00:00:00 2001
>   From: Yi Zhao <yi.zhao@windriver.com>
>   Date: Wed, 19 Jul 2017 09:40:57 +0800
>   Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
> @@ -8,15 +8,16 @@ Allow the recipe can specify specific values for PYTHON.
>   Upstream-Status: Inappropriate [embedded specific]
>   
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
>   ---
>    configure.ac | 26 ++++++++++----------------
>    1 file changed, 10 insertions(+), 16 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 43efd6d..7a31038 100644
> +index 8e0652a..f49b9b3 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -544,9 +544,6 @@ fi
> +@@ -546,9 +546,6 @@ fi
>    dnl Check if version matches that we require
>    PYTHONDEV_CPPFLAGS=
>    PYTHONDEV_LDFLAGS=
> @@ -26,7 +27,7 @@ index 43efd6d..7a31038 100644
>    have_python2=no
>    have_Python_h=no
>    
> -@@ -555,25 +552,22 @@ if echo $PYTHON_VERSION | grep -q ^2; then
> +@@ -557,25 +554,22 @@ if echo $PYTHON_VERSION | grep -q ^2; then
>    
>       dnl Use pkg-config to get runtime search patch missing from ${PYTHON}-config
>       dnl Just do "true" on failure so that configure does not bail out
> @@ -62,6 +63,3 @@ index 43efd6d..7a31038 100644
>    AC_SUBST(BUILD_PYTHON_SITE_PACKAGES)
>    AC_SUBST(BUILD_PYTHON_INC)
>    AC_SUBST(BUILD_PYTHON_LIB)
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> index ff885f1..4096cd5 100644
> --- a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> +++ b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
> @@ -1,4 +1,4 @@
> -From f5bb2a133292b37cd45e3c393e4d43364fe9a11a Mon Sep 17 00:00:00 2001
> +From e585cea1d27be3769c33cf1c0a38bf0de41e2bf9 Mon Sep 17 00:00:00 2001
>   From: Xulin Sun <xulin.sun@windriver.com>
>   Date: Tue, 22 Mar 2016 16:05:32 +0800
>   Subject: [PATCH] dependence on correct header file path
> @@ -10,12 +10,13 @@ No such file or directory
>   Upstream-Status: Inappropriate [embedded specific]
>   
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +
>   ---
>    xlators/features/glupy/src/glupy.c | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/xlators/features/glupy/src/glupy.c b/xlators/features/glupy/src/glupy.c
> -index 7bb88c0..648b966 100644
> +index bca4764..7c2b271 100644
>   --- a/xlators/features/glupy/src/glupy.c
>   +++ b/xlators/features/glupy/src/glupy.c
>   @@ -10,7 +10,7 @@
> @@ -25,8 +26,5 @@ index 7bb88c0..648b966 100644
>   -#include <Python.h>
>   +#include <python2.7/Python.h>
>    
> - #ifndef _CONFIG_H
> - #define _CONFIG_H
> ---
> -1.9.1
> -
> + #include "glusterfs.h"
> + #include "xlator.h"
> diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> index 0468460..884a5f0 100644
> --- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> +++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
> @@ -1,4 +1,7 @@
> -glusterd: change port range
> +From 0102ca092047f51b936d39af966f19b23548c606 Mon Sep 17 00:00:00 2001
> +From: Vu Tran <vu.tran@windriver.com>
> +Date: Wed, 26 Jul 2017 08:42:09 +0800
> +Subject: [PATCH] glusterd: change port range
>   
>   glusterfsd chooses tcp ports within the dynamic
>   range [49152-65535] to provide its service.  When
> @@ -19,6 +22,7 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>   [Yi: minor adjust to apply the patch on 3.11.1]
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
>   ---
>    extras/glusterd.vol | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -34,6 +38,3 @@ index d882007..c8dfe91 100644
>   -#   option base-port 49152
>   +#   option base-port 59152
>    end-volume
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> index 96d7352..5b54974 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
> @@ -1,4 +1,4 @@
> -From a7e6549389f7358cad6a04544b2c1e4d2d5615d0 Mon Sep 17 00:00:00 2001
> +From 61075d7e4459e4cb9168d1c423ac56db240bb463 Mon Sep 17 00:00:00 2001
>   From: Jim Somerville <Jim.Somerville@windriver.com>
>   Date: Wed, 12 Feb 2014 15:41:50 +0000
>   Subject: [PATCH] glusterfs-api remove unnecessary library options
> @@ -11,6 +11,7 @@ Upstream-Status: Inappropriate [embedded specific]
>   
>   Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +
>   ---
>    glusterfs-api.pc.in | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -26,6 +27,3 @@ index 5d23454..8a602f6 100644
>   -Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr
>   +Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr
>    Cflags: -I${includedir}/glusterfs -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> index 81439d1..874f7de 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
> @@ -1,4 +1,7 @@
> -glusterfs: change default nfs port number
> +From 9fdaa80b4c933e8f0e97dfde2ba25ed4cea834d5 Mon Sep 17 00:00:00 2001
> +From: Vu Tran <vu.tran@windriver.com>
> +Date: Wed, 26 Jul 2017 08:42:09 +0800
> +Subject: [PATCH] glusterfs: change default nfs port number
>   
>   Currently both native nfs and glusterfs-nfs use NFS well
>   known port 2049.  This causes native nfs not to be able
> @@ -27,6 +30,7 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>   [Yi: minor adjust to apply the patch on 3.11.1]
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
>   ---
>    libglusterfs/src/common-utils.h | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -44,6 +48,3 @@ index 6bd2417..25a92b0 100644
>    
>    #define GF_CLIENT_PORT_CEILING 1024
>    #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> index f385578..8f3c854 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
> @@ -1,4 +1,4 @@
> -From 32dffb85c81480d53e639ef84242ccfca26461f9 Mon Sep 17 00:00:00 2001
> +From bb34fd21ae26005cf099928f41e68a0d98685eba Mon Sep 17 00:00:00 2001
>   From: Xulin Sun <xulin.sun@windriver.com>
>   Date: Mon, 21 Mar 2016 17:32:50 +0800
>   Subject: [PATCH] glusterfs: configure: automake with subdir-objects & foreign
> @@ -10,12 +10,13 @@ autoconf execution failed when using automake 1.14 around version.
>   Upstream-Status: Pending
>   
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +
>   ---
>    configure.ac | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index ff746ff..983572e 100644
> +index 43efd6d..8ce28f6 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -13,11 +13,11 @@ AC_INIT([glusterfs],
> @@ -32,6 +33,3 @@ index ff746ff..983572e 100644
>    
>    m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
>    
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> index cbff10e..dbc81b6 100644
> --- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> +++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
> @@ -1,3 +1,8 @@
> +From 08b55ee9ccb02db0519ddc9902025e191c1500b1 Mon Sep 17 00:00:00 2001
> +From: Donn Seeley <donn.seeley@windriver.com>
> +Date: Fri, 28 Feb 2014 09:11:02 -0500
> +Subject: [PATCH] Add the glusterfs package
> +
>   The glusterfs code for installing start-up scripts checks for systemd
>   directories on the build host, and if it finds them, it chooses systemd
>   style scripts, otherwise init.d style scripts.  This behavior might
> @@ -13,6 +18,7 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>   [Yi: minor adjust to apply the patch on 3.11.1]
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
>   ---
>    extras/Makefile.am | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -30,6 +36,3 @@ index 3af1103..8978dde 100644
>              $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils
>    
>    confdir = $(sysconfdir)/glusterfs
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> index 97548a5..27b08a8 100644
> --- a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> +++ b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
> @@ -1,4 +1,4 @@
> -From c8be736bd972bb40b03a34bf9565e1bf4880fa7f Mon Sep 17 00:00:00 2001
> +From d4109317c70c86a67464b7deebbe0c3de88773e1 Mon Sep 17 00:00:00 2001
>   From: Xulin Sun <xulin.sun@windriver.com>
>   Date: Fri, 25 Mar 2016 12:33:04 +0800
>   Subject: [PATCH] libglusterfs: Don't link against libfl
> @@ -11,16 +11,17 @@ undefined references to yylex.
>   Upstream-Status: Inappropriate [embedded specific]
>   
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> +
>   ---
>    libglusterfs/src/Makefile.am | 2 +-
>    libglusterfs/src/graph.l     | 1 +
>    2 files changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/libglusterfs/src/Makefile.am b/libglusterfs/src/Makefile.am
> -index 85886c1..e90f553 100644
> +index 52b7316..ab5567a 100644
>   --- a/libglusterfs/src/Makefile.am
>   +++ b/libglusterfs/src/Makefile.am
> -@@ -8,7 +8,7 @@ libglusterfs_la_CPPFLAGS = $(GF_CPPFLAGS) -D__USE_FILE_OFFSET64 \
> +@@ -11,7 +11,7 @@ libglusterfs_la_CPPFLAGS = $(GF_CPPFLAGS) -D__USE_FILE_OFFSET64 \
>    	-I$(CONTRIBDIR)/libexecinfo ${ARGP_STANDALONE_CPPFLAGS} \
>    	-DSBIN_DIR=\"$(sbindir)\" -I$(CONTRIBDIR)/timer-wheel
>    
> @@ -30,7 +31,7 @@ index 85886c1..e90f553 100644
>    
>    lib_LTLIBRARIES = libglusterfs.la
>   diff --git a/libglusterfs/src/graph.l b/libglusterfs/src/graph.l
> -index e4eba9c..78c6ef8 100644
> +index 8af28a4..742d934 100644
>   --- a/libglusterfs/src/graph.l
>   +++ b/libglusterfs/src/graph.l
>   @@ -11,6 +11,7 @@
> @@ -41,6 +42,3 @@ index e4eba9c..78c6ef8 100644
>    %{
>    
>    #define YYSTYPE char *
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> index 9bb90d7..d70a103 100644
> --- a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> +++ b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
> @@ -1,4 +1,4 @@
> -From 485cf109af4adf3050b558cf16c61b620d7b9fb0 Mon Sep 17 00:00:00 2001
> +From fbe4fdfddb096e4e6650908929c366dcc9556ade Mon Sep 17 00:00:00 2001
>   From: Mark Asselstine <mark.asselstine@windriver.com>
>   Date: Thu, 27 Feb 2014 21:50:40 -0500
>   Subject: [PATCH] python: work around host and target python
> @@ -18,6 +18,7 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>   Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
>   [Yi: minor adjust the code to apply the patch on 3.11.1]
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +
>   ---
>    configure.ac                    | 2 ++
>    geo-replication/src/Makefile.am | 3 ++-
> @@ -25,7 +26,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>    3 files changed, 7 insertions(+), 4 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 7a31038..e54d92b 100644
> +index 8ce28f6..8e0652a 100644
>   --- a/configure.ac
>   +++ b/configure.ac
>   @@ -270,6 +270,8 @@ AC_CANONICAL_HOST
> @@ -76,6 +77,3 @@ index 2c48ca5..b1d1126 100644
>                         strcmp (basename (buf + strlen (buf) + 1), GSYNCD_PY)) == 0) {
>                            ret = 1;
>                            break;
> ---
> -1.9.1
> -
> diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
> index 7d26ecf..805c00a 100644
> --- a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
> +++ b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
> @@ -1,3 +1,8 @@
> +From 79c943bba37cb10a462038ec56cd2b8045344951 Mon Sep 17 00:00:00 2001
> +From: Donn Seeley <donn.seeley@windriver.com>
> +Date: Fri, 28 Feb 2014 09:11:02 -0500
> +Subject: [PATCH] Add the glusterfs package
> +
>   Three of the translator makefiles in glusterfs add unnecessary
>   -L$(xlatordir) link options.  This option causes the linker to check
>   the host's $(xlatordir) directory, resulting in contamination that gets
> @@ -8,6 +13,7 @@ Upstream-Status: Pending
>   Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
>   [Xulin: minor adjust to apply the patch]
>   Signed-off-by: Xuin Sun <xulin.sun@windriver.com>
> +
>   ---
>    xlators/mgmt/glusterd/src/Makefile.am    | 2 +-
>    xlators/nfs/server/src/Makefile.am       | 2 --
> @@ -15,10 +21,10 @@ Signed-off-by: Xuin Sun <xulin.sun@windriver.com>
>    3 files changed, 1 insertion(+), 5 deletions(-)
>   
>   diff --git a/xlators/mgmt/glusterd/src/Makefile.am b/xlators/mgmt/glusterd/src/Makefile.am
> -index a8f27fb..8243bf0 100644
> +index b0f5a9b..0caad43 100644
>   --- a/xlators/mgmt/glusterd/src/Makefile.am
>   +++ b/xlators/mgmt/glusterd/src/Makefile.am
> -@@ -54,7 +54,7 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
> +@@ -55,7 +55,7 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
>    
>    AM_CFLAGS = -Wall $(GF_CFLAGS) $(URCU_CFLAGS) $(URCU_CDS_CFLAGS)
>    
> @@ -28,21 +34,23 @@ index a8f27fb..8243bf0 100644
>    CLEANFILES =
>    
>   diff --git a/xlators/nfs/server/src/Makefile.am b/xlators/nfs/server/src/Makefile.am
> -index f91bbcf..b16bb9b 100644
> +index bc6f8e9..56086a1 100644
>   --- a/xlators/nfs/server/src/Makefile.am
>   +++ b/xlators/nfs/server/src/Makefile.am
> -@@ -22,6 +22,4 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
> +@@ -25,8 +25,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
>    
>    AM_CFLAGS = -Wall $(GF_CFLAGS)
>    
>   -AM_LDFLAGS = -L$(xlatordir)
>   -
>    CLEANFILES =
> +
> + EXTRA_DIST = nfsserver.sym
>   diff --git a/xlators/system/posix-acl/src/Makefile.am b/xlators/system/posix-acl/src/Makefile.am
> -index bc5fbc2..0b9fabe 100644
> +index f57070c..70080a6 100644
>   --- a/xlators/system/posix-acl/src/Makefile.am
>   +++ b/xlators/system/posix-acl/src/Makefile.am
> -@@ -10,8 +10,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src
> +@@ -12,8 +12,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
>    
>    AM_CFLAGS = -Wall $(GF_CFLAGS)
>    
> @@ -51,6 +59,3 @@ index bc5fbc2..0b9fabe 100644
>    CLEANFILES =
>    
>    access-control-compat:
> ---
> -1.9.1
> -
> 


