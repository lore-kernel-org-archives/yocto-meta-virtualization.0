Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1621.1601014807612250800
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 23:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EBB3zQKw;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2850; q=dns/txt; s=axis-central1;
  t=1601014808; x=1632550808;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=CLx3HYwl5qacAvgZaz1NW6hhfcQyYKL27G/tafpsVJ8=;
  b=EBB3zQKwBSbLiGr5T8o7JFLyOkacPGXtLbBvjFVGAiB7hNbJW4JpA0Pj
   JE5T1jg7MGF9xVaFi8bwE9XmUJcDrU9she7fpznVZBxa2bH5XQPvTZC/P
   DZFWL4CDS5DOunj+LJnQYyhiKWzUQquf6t3A0ahLyp0o35lCTfu8+WMIw
   1uQh0ATH56MgVJW+GiFXklNNA++iLjXXCT3y+wkrzy3pKST9IhMFTsKth
   /Z3gQBKRfzePU9nByVkNIS0qb5Jg1I9+mseZcC5hPrDuZx317JpL29qb0
   4INJZ7y3nBtC5svZsBPxOuQ+zjbSv3KuogLs7NQoYGLWTEWYvlbuT9kMc
   w==;
IronPort-SDR: Hbotouq5xGdaOdz4l4x23j4O5DOmZiqxsyIKSV4elvirOET/k2uGcOheOutoz0wSzWxUYN5gMZ
 64dETlfqz33GrGyOuaXobf2jnvU5bRAGgD6ZxV3bv+ixPRXX3nGJBHNF55kCd8zpR1+YpUQAXX
 7CmhvW2i9KxMgDP/u23ECSfJI6qfsnsKNBdIo1LXEnEiCFasR7WXRP4j1p8kibLmO1M0qXc+I6
 4Pw4fYhSu15cUH4RIhEJDVIyfat+tx1/S6hai4AbJWi08ATy589uKb0+j/bNvFe0g56E/9c2rp
 A4o=
X-IronPort-AV: E=Sophos;i="5.77,301,1596492000"; 
   d="scan'208";a="13347377"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
 <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
 <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
Date: Fri, 25 Sep 2020 08:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-09-24 17:41, Bruce Ashfield wrote:
> 
> There are at least two utilities that are shared with the main 
> kubernetes and not in our existing layer dependencies. We shouldn't 
> expand our dependencies more, so we have to look at importing a 
> variant of the recipes to meta-virt, or seeing about getting the 
> recipes into a more common location. In particular, I'm talking
> about ipset and and upx, and I'm still looking for more.

Ah, yes.

> As for the service files, the k3s.service is different from the one 
> from the latest on the k3s 1.18 branch, and there's a patch that 
> modifies it. Although tempting to not use /usr/local/bin, for 
> maintenance, we'd be better off either just installing where things 
> are expected. Was something broken if /usr/local/bin was used ?

The target systems I work on prohibits installations to /usr/local, so
from my perspective something would in fact be broken if /usr/local/bin
was to be used. Nevertheless, configuring the recipe to have
/usr/{$VARIABLE}/bin and VARIABLE set to "local" as default would
perhaps be an option for everybody to eat the cake and still have it?

> The other .service files, we have no idea where they come from by 
> looking at the series, and as such they need some sort of comment
> (by looking at the repo, you can tell they are variants of the
> k3s.service file, but that needs to be clarified).

I will investigate.

> The patches themselves to the code base (not just the overall git 
> commit) should have Signed-off-by: and Upstream-status: flags, so
> they can be maintained as I bump through releases.

I will see to that.

> The scripts being created by the recipe, need license headers and
> spdx tags. Boring, but it is something we want to make sure is in
> new files.

Absolutely!

> Also, at a glance, we need to make sure the dependencies of the 
> scripts are captured in the DEPENDS of the recipe (i.e. I see 'ip' 
> being called, make sure that is captured).

Ah, yes, I will go through that.

> As for the networking, what we have in the submission is specific to
> a setup, that's the parts that I'm really trying to unify. We need
> to document what is expected in the CNI configuration, and then
> control it via a distro/image flag such that it won't
> clobber/conflict with other CNI users. I can take care of that distro
> part, but the documentation would be ideal in a README that comes
> along with the recipe.

That also sounds like a good plan. I am not relly sure what text to
write in that README file, though. But I guess that is something that
can be iteratively created.

> As I said, I'm still working through some of the factoring out and 
> de-duplication, but there's some things in there that are best done
> on your end, versus mine.

Excellent!

BR,

/Joakim
