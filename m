Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4611DE0084A; Tue, 27 Jun 2017 01:37:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79743E00524
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 01:36:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5R8aw6W017061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 01:36:59 -0700
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 27 Jun 2017 01:36:58 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1498551781-10414-1-git-send-email-zhe.he@windriver.com>
	<1498551781-10414-2-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <7802060c-9957-0c33-b67d-bd5ac41c6e03@windriver.com>
Date: Tue, 27 Jun 2017 16:36:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1498551781-10414-2-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.196]
Subject: Re: [PATCH] ovs:fix cross compilation failure
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
X-List-Received-Date: Tue, 27 Jun 2017 08:37:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore

On 2017年06月27日 16:23, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> configure with_dpdk and cross compile fails with:
> "configure: error: cannot check for file existence
> when cross compiling"
>
> This is due to the usages of AC_CHECK_FILES.
>
> AC_CHECK_FILES only works when not cross compiling. It test
> a feature of the host machine, and therefore, die when
> cross-compiling.
>
> The current patch put the check in condition, i.e. check only
> if not cross-compiling.
>
> This patch has been tested on ARM64 platform with DPDK16.07
>
> UpstreamLink::https://mail.openvswitch.org/pipermail/ovs-dev/
> 2016-August/322005.html
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to meta-virtualization on <20170627>
>
> Signed-off-by: Hemant Agrawal <hemant.agrawal at nxp.com>
> Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
> [ Adjust context to apply. Note that this patch is from mailing
>   list but is not merged into upstream repo.]
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../files/fix-cross-compilation-failure.patch       | 21 +++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch_git.bb   |  5 +++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/files/fix-cross-compilation-failure.patch
>
> diff --git a/recipes-networking/openvswitch/files/fix-cross-compilation-failure.patch b/recipes-networking/openvswitch/files/fix-cross-compilation-failure.patch
> new file mode 100644
> index 0000000..2d2851a
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/fix-cross-compilation-failure.patch
> @@ -0,0 +1,21 @@
> +openvswitch:fix cross compilation failure
> +
> +upstreamlink:https://mail.openvswitch.org/pipermail/ovs-dev/
> +2016-August/322005.html
> +
> +--- git/acinclude.m4   2017-05-14 23:52:13.031712727 -0700
> ++++ git/acinclude.m4   2017-05-14 23:53:48.639691817 -0700
> +@@ -180,9 +180,10 @@ AC_DEFUN([OVS_CHECK_DPDK], [
> +         DPDK_INCLUDE="$with_dpdk/include"
> +         # If 'with_dpdk' is passed install directory, point to headers
> +         # installed in $DESTDIR/$prefix/include/dpdk
> +-        AC_CHECK_FILE([$DPDK_INCLUDE/rte_config.h], [],
> +-                      [AC_CHECK_FILE([$DPDK_INCLUDE/dpdk/rte_config.h],
> +-                                     [DPDK_INCLUDE=$DPDK_INCLUDE/dpdk], [])])
> ++      if test ! -e "$DPDK_INCLUDE/rte_config.h" && \
> ++              test -e "$DPDK_INCLUDE/dpdk/rte_config.h"; then
> ++              DPDK_INCLUDE=$DPDK_INCLUDE/dpdk/rte_config.h
> ++        fi
> +         DPDK_LIB_DIR="$with_dpdk/lib"
> +         ;;
> +     esac
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 6ab0c40..9608095 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -30,12 +30,13 @@ SRC_URI = "file://openvswitch-switch \
>             file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
>             file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
>             file://CVE-2017-9263.patch \
> +           file://fix-cross-compilation-failure.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
>  
> -PACKAGECONFIG ?= ""
> -PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
> +PACKAGECONFIG ?= "dpdk"
> +PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
>  
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.


