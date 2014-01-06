Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E125E00529
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:28:26 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id n7so9751174lam.21
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Jan 2014 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x9dyV6FmRGKXzx0xSmoQcDF+U93FMsSJUX1aO+qgXfo=;
	b=JJYOaMBkvLuK3iRS/vDYpASySjd4bwhWHmZSmunQGeluXYLVPdXVe1qMBFjdL+INZp
	hruP927DnT9g23MYJzVVoJGt3flKFdZwnc0mJFLUZc1k/bBvrXv5JTXjTWWwQIduI73G
	K8/lvx8/9qgtfm5nvvN5FTNtTaQA00iG56CLehk/wdlIJfwaUICI0cySPkquckds1dG6
	4oJSANSJ1NbO4Q/NzcPwBl0eqRe7ndrUDvWFiyigkRGas4badarFu/1N/nLcApealFP0
	D1tlCEFiM/qt4t3871IaUxlJC04Itk27iqIgwHZWPbffC7ojvzCZSjYD6dOzv6rIqNnb
	rUUw==
MIME-Version: 1.0
X-Received: by 10.112.159.132 with SMTP id xc4mr535876lbb.62.1389018505266;
	Mon, 06 Jan 2014 06:28:25 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Mon, 6 Jan 2014 06:28:25 -0800 (PST)
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
Date: Mon, 6 Jan 2014 09:28:25 -0500
Message-ID: <CADkTA4MwcrmUi=rhBabySsMaiid9yS1r6J-9S36QxDRY+4A3vg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-openstack][PATCH 0/9] Python web recipe fixes
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
X-List-Received-Date: Mon, 06 Jan 2014 14:28:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 6, 2014 at 9:09 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I made use of these recipes outside of the context of OpenStack; here
> are some patches for issues I noticed.

Thanks Paul. I merged the whole series.

There are *MANY* more issues like this, and while I have plans to loop around
and do cleanups .. I'm not sure how long it'll take. So if you are
ever wandering
by and see more crimes, I'm happy to have them pointed out.

Cheers,

Bruce

>
>
> The following changes since commit 93d2434e1ae3d7d0fc568005c2ec82846e31cba0:
>
>   Revert "horizon: update to 2013.2.2" (2013-12-20 11:25:59 -0500)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib paule/mcs-python-fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/mcs-python-fixes
>
> Paul Eggleton (9):
>   python-flask: correct LICENSE
>   python-itsdangerous: correct LICENSE
>   python-jinja2: correct LICENSE
>   python-markupsafe: make LICENSE more accurate
>   python-werkzeug: correct LICENSE
>   python-itsdangerous: add missing python module dependencies
>   python-jinja2: add missing python module dependencies
>   python-markupsafe: add missing python module dependencies
>   python-werkzeug: add missing python module dependencies
>
>  meta-openstack/recipes-devtools/python/python-flask_0.10.1.bb      | 2 +-
>  meta-openstack/recipes-devtools/python/python-itsdangerous_0.23.bb | 5 ++++-
>  meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb      | 4 +++-
>  meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb   | 5 ++++-
>  meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb    | 5 ++++-
>  5 files changed, 16 insertions(+), 5 deletions(-)
>
> --
> 1.8.1.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

