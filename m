Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FBA6E00724; Tue, 14 Mar 2017 07:12:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BD4FE00566
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 07:12:35 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EECYeK014406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 07:12:35 -0700 (PDT)
Received: from server.local (128.224.23.1) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 07:12:34 -0700
To: Zhenbo Gao <zhenbo.gao@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1489456606-160060-1-git-send-email-zhenbo.gao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c89c7601-650f-f47a-4e6c-161fd2de59ce@windriver.com>
Date: Tue, 14 Mar 2017 10:12:33 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1489456606-160060-1-git-send-email-zhenbo.gao@windriver.com>
Subject: Re: [PATCH] libvirt: fix QA warning caused by missing acl build dep
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
X-List-Received-Date: Tue, 14 Mar 2017 14:12:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 2017-03-13 9:56 PM, Zhenbo Gao wrote:
> The patch fix the following QA warning:
> --
> WARNING: QA Issue: libvirt rdepends on libacl, but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 152130d..025a9ef 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  SECTION = "console/tools"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> -	   iptables dnsmasq readline libtasn1 libxslt-native"
> +	   iptables dnsmasq readline libtasn1 libxslt-native acl"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
>


