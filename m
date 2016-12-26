Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60DC4E007BA; Sun, 25 Dec 2016 17:54:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64BC9E00519
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 17:54:29 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBQ1sTtZ003021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 17:54:29 -0800
Received: from bruce-ashfields-macbook.local (128.224.20.100) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Dec 2016 17:54:28 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1482507392-26098-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <58607853.4060909@windriver.com>
Date: Sun, 25 Dec 2016 20:54:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1482507392-26098-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [mcs][PATCH] housekeeping: rename bbappends to match the recipe versions
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
X-List-Received-Date: Mon, 26 Dec 2016 01:54:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

merged

Bruce

On 16-12-23 10:36 AM, Mark Asselstine wrote:
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend      | 3 ---
>   meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend       | 3 +++
>   meta-openstack/recipes-graphics/xorg-app/xterm_320.bbappend            | 1 -
>   meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend            | 1 +
>   .../recipes-support/bash-completion/bash-completion_2.%.bbappend       | 1 +
>   .../recipes-support/bash-completion/bash-completion_2.1.bbappend       | 1 -
>   meta-openstack/recipes-support/libbsd/libbsd_0.7.0.bbappend            | 1 -
>   meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend            | 1 +
>   8 files changed, 6 insertions(+), 6 deletions(-)
>   delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
>   create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
>   delete mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_320.bbappend
>   create mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
>   create mode 100644 meta-openstack/recipes-support/bash-completion/bash-completion_2.%.bbappend
>   delete mode 100644 meta-openstack/recipes-support/bash-completion/bash-completion_2.1.bbappend
>   delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.7.0.bbappend
>   create mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>
> diff --git a/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend b/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
> deleted file mode 100644
> index 2a53557..0000000
> --- a/meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -RRECOMMENDS_${PN} += "kernel-module-xt-conntrack \
> -                      kernel-module-xt-redirect \
> -                      "
> diff --git a/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend b/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
> new file mode 100644
> index 0000000..2a53557
> --- /dev/null
> +++ b/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
> @@ -0,0 +1,3 @@
> +RRECOMMENDS_${PN} += "kernel-module-xt-conntrack \
> +                      kernel-module-xt-redirect \
> +                      "
> diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_320.bbappend b/meta-openstack/recipes-graphics/xorg-app/xterm_320.bbappend
> deleted file mode 100644
> index bb8c310..0000000
> --- a/meta-openstack/recipes-graphics/xorg-app/xterm_320.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -DEPENDS += "freetype-native"
> diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend b/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
> new file mode 100644
> index 0000000..bb8c310
> --- /dev/null
> +++ b/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
> @@ -0,0 +1 @@
> +DEPENDS += "freetype-native"
> diff --git a/meta-openstack/recipes-support/bash-completion/bash-completion_2.%.bbappend b/meta-openstack/recipes-support/bash-completion/bash-completion_2.%.bbappend
> new file mode 100644
> index 0000000..7447c56
> --- /dev/null
> +++ b/meta-openstack/recipes-support/bash-completion/bash-completion_2.%.bbappend
> @@ -0,0 +1 @@
> +inherit autotools-brokensep
> diff --git a/meta-openstack/recipes-support/bash-completion/bash-completion_2.1.bbappend b/meta-openstack/recipes-support/bash-completion/bash-completion_2.1.bbappend
> deleted file mode 100644
> index 7447c56..0000000
> --- a/meta-openstack/recipes-support/bash-completion/bash-completion_2.1.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -inherit autotools-brokensep
> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.7.0.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.7.0.bbappend
> deleted file mode 100644
> index 7447c56..0000000
> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.7.0.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -inherit autotools-brokensep
> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
> new file mode 100644
> index 0000000..7447c56
> --- /dev/null
> +++ b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
> @@ -0,0 +1 @@
> +inherit autotools-brokensep
>


