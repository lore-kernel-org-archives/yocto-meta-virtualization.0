Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2B6FE00A0A; Fri, 28 Sep 2018 19:45:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6A52E009D9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Sep 2018 19:45:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T2ixYU002445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Sep 2018 19:44:59 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 28 Sep 2018 19:44:59 -0700
To: <meta-virtualization@yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@windriver.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <195d65f8-15f6-41e7-c3bc-53aff2ddf57b@windriver.com>
Date: Sat, 29 Sep 2018 10:50:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [m-c-s][PATCH 1/7] glusterfs: fix CVE-2018-10911
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
X-List-Received-Date: Sat, 29 Sep 2018 02:45:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/26/2018 10:36 AM, Chen Qi wrote:
> Backport patch to fix the following CVE.
>
> CVE: CVE-2018-10911
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...-negative-key-value-length-while-unserial.patch | 39 ++++++++++++++++++++++
>   recipes-extended/glusterfs/glusterfs.inc           |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
>
> diff --git a/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch b/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
> new file mode 100644
> index 0000000..cb3400b
> --- /dev/null
> +++ b/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
> @@ -0,0 +1,39 @@
> +From 428ee988df7d6cbe6e18becffcee5cdfb0fa9d17 Mon Sep 17 00:00:00 2001
> +From: Amar Tumballi <amarts@redhat.com>
> +Date: Tue, 24 Jul 2018 13:25:12 +0530
> +Subject: [PATCH 1/7] dict: handle negative key/value length while unserialize
> +
> +Fixes: bz#1625089
> +Change-Id: Ie56df0da46c242846a1ba51ccb9e011af118b119
> +Signed-off-by: Amar Tumballi <amarts@redhat.com>
> +
> +Upstream-Status: Backport
> +
> +Fix CVE-2018-10911
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + libglusterfs/src/dict.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/libglusterfs/src/dict.c b/libglusterfs/src/dict.c
> +index 839b426..ac0a677 100644
> +--- a/libglusterfs/src/dict.c
> ++++ b/libglusterfs/src/dict.c
> +@@ -2751,6 +2751,13 @@ dict_unserialize (char *orig_buf, int32_t size, dict_t **fill)
> +                 vallen = ntoh32 (hostord);
> +                 buf += DICT_DATA_HDR_VAL_LEN;
> +
> ++                if ((keylen < 0) || (vallen < 0)) {
> ++                        gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
> ++                                          LG_MSG_UNDERSIZED_BUF,
> ++                                          "undersized length passed "
> ++                                          "key:%d val:%d", keylen, vallen);
> ++                        goto out;
> ++                }
> +                 if ((buf + keylen) > (orig_buf + size)) {
> +                         gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
> +                                           LG_MSG_UNDERSIZED_BUF,
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index ab63a9a..ea5f2b7 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -23,6 +23,7 @@ SRC_URI += "file://glusterd.init \
>               file://0001-shared-storage-Prevent-mounting-shared-storage-from-.patch \
>               file://0002-server-auth-add-option-for-strict-authentication.patch \
>               file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch \
> +            file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
>              "
>   
>   LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"



