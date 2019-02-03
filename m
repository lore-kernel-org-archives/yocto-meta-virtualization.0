Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F36D6E00D2C; Sat,  2 Feb 2019 19:42:56 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57CBAE00BAB
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:42:56 -0800 (PST)
Received: by mail-lj1-f193.google.com with SMTP id t9-v6so8990276ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XTdqVCXtSoQcFTLwmwQ93TQjiAuY7jhItKNMKvMZgMI=;
	b=uO4VC36i4X4zWolAyCV6M9i1lGChNl8OJu60ePdWpp/8CGbXB6n2h6O2pUk5B00uNM
	/eXkTrq2qDZYZoWCCMOgUJZxZlzXuXwc3E2/xigFl/tjiLwAL332TsP/s2heaTkCAi9I
	7NSDDd9bNvC6uVgvfF78FuGnwi3m2XU0oojp0ie83MVvmAmOUDsN0EXrHcuPaE6RBtl+
	4mYp2LOJr+fKLXSklUcLs7ZzNRIMViRH18Z7fQ8kn/cBUzs5wzRvRxMM3GvJYQy5Iy6o
	IqikjmfrHZpXKHxtFMXeFsHOdUt1WGBWA4zy3xax+VwGI7VD9MAjHSLWW9qkIIKxybyP
	A6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XTdqVCXtSoQcFTLwmwQ93TQjiAuY7jhItKNMKvMZgMI=;
	b=nPexsqOCyAhTO4EhGDG/gL6O5CV6HrV/NuZy5wb0Cl/wivuMs5EPDqrGrw/+bUa5PR
	ZynQ/KE/I3ryFp6oiSxMgJjKBePRYDE/iRHgbCzRNA5ZGKhOYWCHxiimGHrzwjQINrMS
	oznQ1puonKgdGlQ2/n4ecaOn3wWfpbyKWkwJwYhvAUuRZNZtcQ2fOO5wnqtx26ZfZg4O
	eHX7MW1E9LcJ2SLpg3F2P8FchkxuVItlk64Tqe6sfeZDyD9xDWLvBMXQRTgyFixqEHIn
	n2QZnWRQg024CH80Lqb2waQgBb9lgvYjjcQuYRoflXMIgowmAGifep/IueRfT3QYkQ8o
	C6vA==
X-Gm-Message-State: AJcUukeulbwchTFE84emB3QID5j1tGfRWqrFxU4rPTUGiHlByYFFx1cT
	hSg0CdjSs1u4RowPxgHNxuAE3IVy3L2x4fbkE2M=
X-Google-Smtp-Source: ALg8bN4LJgzuCWalEThrxsTCiGE6NOdCR+OogzuVxumLsfb6Ap4gnt5PhJaUXA2kuOyXG/VzMP8OE1+03mZ9RNqYnWk=
X-Received: by 2002:a2e:8554:: with SMTP id
	u20-v6mr35449998ljj.193.1549165375009; 
	Sat, 02 Feb 2019 19:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
	<20190130004249.20870-3-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190130004249.20870-3-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:42:43 -0500
Message-ID: <CADkTA4NZbVYFTbBWeF7xYGFVbG=fTJN5Q8di34XKc+ZieOTC8g@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-waitress:upgrade to 1.2.0
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
X-List-Received-Date: Sun, 03 Feb 2019 03:42:57 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jan 29, 2019 at 7:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-waitress from 1.1.0 to 1.2.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../{python-waitress_1.1.0.bb => python-waitress_1.2.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-waitress_1.1.0.bb => python-waitress_1.2.0.bb} (62%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
> similarity index 62%
> rename from meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> rename to meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
> index 5636420..e516d2b 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.2.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "ZPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
> -SRC_URI[sha256sum] = "d33cd3d62426c0f1b3cd84ee3d65779c7003aae3fc060dee60524d10a57f05a9"
> +SRC_URI[md5sum] = "8c5492d3c1a2e0cd80780175686dbb0f"
> +SRC_URI[sha256sum] = "e624c829656ffc99b33d661072b2814885ae92835cf835ee8ab283ddb7c915b9"
>
>  inherit setuptools pypi
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

