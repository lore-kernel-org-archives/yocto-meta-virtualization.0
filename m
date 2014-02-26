Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30E22E008F9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:36 -0800 (PST)
Received: by mail-lb0-f171.google.com with SMTP id w7so989062lbi.30
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h7+o3C9POOPqQ0X2Lmg/NTUDj918c1O7uECncestZKg=;
	b=IKIFrGt+OTG/tKpZEIb8SHGAnIAoiWB/hfhopzb22kEUw2HcWPtvi9QOBp3p0pjKeS
	lFMfs5t92eI2yzM7ludab8kbyTnRITEsr7H00/2mmHBGlKyHTpIo8zzH2vfkHoKO5RMc
	49OXKRq6mvxlUpM3T87Wz7YEFYLmi9T+jfDKBiy8IyGdm3GkAwLIvP70SsMO54tk3Mtj
	tANH5eMwSSksG/HfSPH37DF3expJRvcPL6HoCTHyHG7cLNAtCHiKwY0O08pxaOnVJpXt
	UsGMn/euuVj5gHyh2QWktjtiANLWfccvQAjFyMHsupgh/WZRYW5Am5BxHgqU+slnDLOa
	+sDA==
MIME-Version: 1.0
X-Received: by 10.112.202.36 with SMTP id kf4mr2178491lbc.66.1393443335685;
	Wed, 26 Feb 2014 11:35:35 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 26 Feb 2014 11:35:35 -0800 (PST)
In-Reply-To: <1393409277-17451-2-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<1393409277-17451-2-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Feb 2014 14:35:35 -0500
Message-ID: <CADkTA4MhoEcOgUfKzBPpTMeCA7CNJ-Bce=svyZVC5h_ZK5EZ1A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/5] libvirt: Change license to LGPLv2.1+
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
X-List-Received-Date: Wed, 26 Feb 2014 19:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> libvirt is to a large extent licensed under LGPLv2.1 (or later) rather
> than GPLv2. From my investigations, there are only some tests and a
> couple of files under tools are licensed as GPL. Other than that, files
> are generally licensed as LGPL. My recommendation is therefore to set
> the default license to LGPLv2.1+, and to add a LICENSE_${PN}-ptest that
> is set to LGPLv2.1+ & GPLv2+ if a ptest package is added. This is
> preferred to avoid having to specify explicit licenses for every other
> package, such as the auto generated libvirt-locale-XX packages.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
> index 3b95486..d30f09d 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
> @@ -1,7 +1,8 @@
>  DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux."
>  HOMEPAGE = "http://libvirt.org"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "console/tools"
>  PR = "r1"
>
> --
> 1.9.rc1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

