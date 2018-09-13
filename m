Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EFBDE006C7; Thu, 13 Sep 2018 02:53:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D15E3E0053F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Sep 2018 02:53:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8D9rwIK021834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Sep 2018 02:53:58 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 13 Sep 2018 02:53:57 -0700
To: <meta-virtualization@yoctoproject.org>
References: <1536829087-2306-1-git-send-email-Qi.Chen@windriver.com>
	<1536829087-2306-2-git-send-email-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ce28d32c-f3c8-f1a2-f9f6-9f6c2b5a2c86@windriver.com>
Date: Thu, 13 Sep 2018 17:59:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1536829087-2306-2-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [m-c-s][PATCH 2/2] glusterfs: fix CVE-2018-10841
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
X-List-Received-Date: Thu, 13 Sep 2018 09:53:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch.
It has a typo 'patc', which should be 'patch', and thus will cause 
do_fetch failure.
I forgot to test it.

I'll send out V2.

Best Regards,
Chen Qi

On 09/13/2018 04:58 PM, Chen Qi wrote:
> Backport patch to fix the following CVE.
>
> CVE: CVE-2018-10841
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...ccess-trusted-peer-group-via-remote-host-.patch | 43 ++++++++++++++++++++++
>   recipes-extended/glusterfs/glusterfs.inc           |  1 +
>   2 files changed, 44 insertions(+)
>   create mode 100644 recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
>
> diff --git a/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch b/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
> new file mode 100644
> index 0000000..dcbb435
> --- /dev/null
> +++ b/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
> @@ -0,0 +1,43 @@
> +From e79741414777c25e5c2a08e6c31619a0fbaad058 Mon Sep 17 00:00:00 2001
> +From: Mohit Agrawal <moagrawa@redhat.com>
> +Date: Wed, 20 Jun 2018 16:13:00 +0530
> +Subject: [PATCH 3/3] glusterfs: access trusted peer group via remote-host
> + command
> +
> +Problem: In SSL environment the user is able to access volume
> +         via remote-host command without adding node in a trusted pool
> +
> +Solution: Change the list of rpc program in glusterd.c at the
> +          time of initialization while SSL is enabled
> +
> +BUG: 1593232
> +Change-Id: I987e433b639e68ad17b77b6452df1e22dbe0f199
> +fixes: bz#1593232
> +Signed-off-by: Mohit Agrawal <moagrawa@redhat.com>
> +
> +Upstream-Status: Backport
> +Fix CVE-2018-10841
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + xlators/mgmt/glusterd/src/glusterd.c | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/xlators/mgmt/glusterd/src/glusterd.c b/xlators/mgmt/glusterd/src/glusterd.c
> +index ef20689..5e0ed8d 100644
> +--- a/xlators/mgmt/glusterd/src/glusterd.c
> ++++ b/xlators/mgmt/glusterd/src/glusterd.c
> +@@ -1646,11 +1646,6 @@ init (xlator_t *this)
> +                         goto out;
> +                 }
> +                 /*
> +-                 * With strong authentication, we can afford to allow
> +-                 * privileged operations over TCP.
> +-                 */
> +-                gd_inet_programs[1] = &gd_svc_cli_prog;
> +-                /*
> +                  * This is the only place where we want secure_srvr to reflect
> +                  * the management-plane setting.
> +                  */
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 8bf5653..fa25bd8 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -22,6 +22,7 @@ SRC_URI += "file://glusterd.init \
>               file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
>               file://0001-shared-storage-Prevent-mounting-shared-storage-from-.patch \
>               file://0002-server-auth-add-option-for-strict-authentication.patch \
> +            file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patc \
>              "
>   
>   LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"



