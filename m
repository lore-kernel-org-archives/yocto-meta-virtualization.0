Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C65CAE00D8A; Sun, 13 Oct 2019 16:44:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08908E00C74
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:44:09 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id b20so14813026ljj.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Oct 2019 16:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9qHOx4idSZpbJ1JIPS4LozV/3UuO+fPvdPT7XD2/3mw=;
	b=Zs010+TFkc39Mfl3QdSQsFAiwmfafzgpAUlRJtBrzNF8c9gEtJSFCn14VK4FF85JwU
	z/sCFMa6kbsq3sIP6GyESuK0em03SRwLwQOgQ/oAhHVoVI0LATUhs+C/ZdyCIYcMly9A
	6fAr8+4nd3X2uaqbZlvvTX2SLEEGjCm7uyGYv1TEy2cbMSe9sdl4jXRBhe/T1MCudxnC
	l1M0PEO8TbFGt637s9ruOF5qKBXNV2uV2bOyKgytxiw939c4FuOpk9PN4Vn7J5Im4vOD
	uftEGvWCtat99FEx7zKbjtLWjjnwXBaOhnQogM17kzhOtO4XfCR1T36vmWJkjT1oK3NU
	QWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9qHOx4idSZpbJ1JIPS4LozV/3UuO+fPvdPT7XD2/3mw=;
	b=jxZVjXp/732EU3ZPc3lrPeJ86dycaU8irlxJK/RQFQRabKxxcfXodWmREqbunK04fb
	KTbPCPujyXknnXJ2EFOWvdRx7ZsHR9R1WqQsPp/3LcZb3/U+oiIHQne+hpwAoeiJ04VP
	e8nSVwnpr+YprfxIBmhLNZwRi9FsAOALT9MBYH1Y7sm5ENO6sanzWRQ4+jVgzRTj3FlP
	TLp7OLoAvbXmFLhXWq1SusHZHcZ9PVSngfccfhiV6Uz1toT+YgOKdKZT4DC5bELkJ398
	NCW1D8e3eXXywWvGXU0YYES3C/D2gL+Ps+jVPMeXFgG4px3CaAxWFtahmB45+Snxh1KA
	D0ig==
X-Gm-Message-State: APjAAAV0AqN+tgY6whcOmi3CxaVvZmdslzTq7MLlOa86GJQGAVnJYgkO
	CDzIifwX32kem70m409MCLEIv8B9qCK/bJsSZ/377W4hbcQ=
X-Google-Smtp-Source: APXvYqx75hh0KrZeRPmYk/J9LLXgiHd3HFq9MPCQtaOZmrfDXt30TXNKyT6Cj5fthfiJ693WnyTA26WuihAg//ShQO4=
X-Received: by 2002:a2e:9693:: with SMTP id q19mr16265652lji.6.1571010248826; 
	Sun, 13 Oct 2019 16:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <1570871144-49146-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1570871144-49146-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Oct 2019 19:43:57 -0400
Message-ID: <CADkTA4MSC2=RWtnpa9qNQfx0zjzcsYai9WshJBS1LaNfVmSnQg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] meta-openstack: linux-yocto: Remove non-existing kernel options
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
X-List-Received-Date: Sun, 13 Oct 2019 23:44:10 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sat, Oct 12, 2019 at 5:05 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> The following kernel options have been removed from kernel.
>
> CONFIG_NF_NAT_PROTO_SCTP removed by
> faec18dbb0405 ("netfilter: nat: remove l4proto->manip_pkt")
>
> CONFIG_NF_NAT_IPV4 removed by
> 3bf195ae6037e ("netfilter: nat: merge nf_nat_ipv4,6 into nat core")
>
> CONFIG_NF_CONNTRACK_PROC_COMPAT removed by
> adf0516845bc ("netfilter: remove ip_conntrack* sysctl compat code")
>
> CONFIG_NF_NAT_NEEDED removed by
> 4806e975729f ("netfilter: replace NF_NAT_NEEDED with IS_ENABLED(CONFIG_NF_NAT)")
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg | 3 ---
>  meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg           | 4 ----
>  2 files changed, 7 deletions(-)
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
> index 6e1cff7..91b8209 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/iptables-nat.cfg
> @@ -1,7 +1,5 @@
>  CONFIG_NF_NAT=m
> -CONFIG_NF_NAT_NEEDED=y
>  CONFIG_NF_NAT_PROTO_UDPLITE=m
> -CONFIG_NF_NAT_PROTO_SCTP=m
>  CONFIG_NF_NAT_AMANDA=m
>  CONFIG_NF_NAT_FTP=m
>  CONFIG_NF_NAT_IRC=m
> @@ -12,7 +10,6 @@ CONFIG_NETFILTER_XT_TARGET_NETMAP=m
>
>  CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
>
> -CONFIG_NF_NAT_IPV4=m
>  CONFIG_IP_NF_TARGET_MASQUERADE=m
>  CONFIG_IP_NF_TARGET_NETMAP=m
>  CONFIG_IP_NF_TARGET_REDIRECT=m
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> index 676a091..5821a43 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> @@ -1,7 +1,3 @@
>  CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_NAT=m
> -CONFIG_NF_NAT_NEEDED=y
> -CONFIG_NF_NAT_PROTO_SCTP=m
> -CONFIG_NF_CONNTRACK_PROC_COMPAT=y
> -CONFIG_NF_NAT_IPV4=m
>  CONFIG_IP_NF_NAT=m
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

