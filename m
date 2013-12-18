Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56E4AE007AD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 13:16:19 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBILGIPI007114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Dec 2013 13:16:18 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 18 Dec 2013 13:16:19 -0800
Message-ID: <52B21099.7000006@windriver.com>
Date: Wed, 18 Dec 2013 16:16:09 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1387399322-4509-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1387399322-4509-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] openvswitch: add missing inherit
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
X-List-Received-Date: Wed, 18 Dec 2013 21:16:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-12-18 03:42 PM, Mark Asselstine wrote:
> openvswitch requires pkgconfig or you may see an error:
>
> configure.ac:53: error: Please install pkg-config.
>
> during configure.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> Bruce,
>
> Here is another set of commits to fix potential build issues, usually
> encountered while building out of sstate. Sorry for not grouping these
> with my recent lxc commit, I pulled the trigger too quickly.

merged all three.

Bruce

>
> Mark
>
>
>   recipes-networking/openvswitch/openvswitch_1.10.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> index 02c8ab3..931beb8 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -59,7 +59,7 @@ FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
>   FILES_${PN} += "${datadir}/ovsdbmonitor"
>   FILES_${PN} += "/run"
>
> -inherit autotools update-rc.d
> +inherit autotools update-rc.d pkgconfig
>
>   INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
>   INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
>


