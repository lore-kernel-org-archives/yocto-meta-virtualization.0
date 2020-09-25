Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.8407.1601041814861735881
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 06:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Lx662WtO;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1116; q=dns/txt; s=axis-central1;
  t=1601041815; x=1632577815;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XktJlAEuhxmOJCeOzLAPaBHc/CeKxtIxa1IAbWQkCqk=;
  b=Lx662WtOCXnFsgeyoscL8J+Km1MSXLYeS3L8ql+puZtYKaxkfTu4TmNX
   Ig+81Cr9kqrr42MOBzzuMcqhtfZeD/D89LQVM84HvyFGr1SaVZ6aro2Qf
   GTQUMYDO45+nPzzBDRbD0QMLufTu+Nx7AfOTtHULuocapf4mYtGIGY4jB
   HwUvlCzGqnqVb7aqE1F4GszAocsrGAzLH8qRQ2x4QZhk+H+PDexTDK5vd
   gQjcRyKAd/A2hKryv5V1LmpvA4Y3E52cKD9j3kjolFGFUF0bN2VeEHvOd
   ATHK5kKWCbpsfKNPL/7NcUaX6cxfNi97TinerPz1A1/wiy9ZaTn8nosyc
   w==;
IronPort-SDR: A+FjMK2LzLUe9a0JAD0fal/qL/qmNhIEcVhg05ALayCg4/Dpuj0OaU8LrERivaAohEoIpQdk1y
 A8Ls7gvRwMSXyjTviJGvB4VerRvpDr050W5X+A0rkPO/+2OxaTis2Fb4h8ujI3aONi8i3DcOZH
 +jSGM2qGXTKMIIuvfKta0+cQupXQBEZqTHf+AcJrFDhiVwYFYQWRmNnp5fa/lpB0hEOZ8FXozL
 ZzxssWACA8CxKKMECuXgvTa1bDgCmGzCHYlBzYKhK9auL+PBNcVHQYzSjCk2gTF6DXQd6Pgeqb
 NgM=
X-IronPort-AV: E=Sophos;i="5.77,302,1596492000"; 
   d="scan'208";a="13362643"
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
 <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
 <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <fe1ed6e4-d1b5-cb35-10a8-0c0071bea825@axis.com>
Date: Fri, 25 Sep 2020 15:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-09-25 15:12, Bruce Ashfield wrote:
> 
> Absolutely. I'm always in favour of making these configurable, so we
> can let users customize as they see fit.

Wonderful.

I finalized a quite (IMO) nice solution during the day, where
${exec_prefix} would be the fixed starting point and /bin the ending
dito, and what is in between configurable. But I like your suggestion
with even more flexibility better and will update according to that.

> I just had to go through the License / SPDX header addition for
> hundreds of files. So I know what a pain this can be, so thanks!

No worries, I find those things very important too.

> Absolutely. Just a stream of thoughts is fine for now, with a quick
> overview, and perhaps a guideline on how to build a single node
> system ? With a few notes about what is configured out of the box
> and what we expect the end user to continue to configure / customize ?

Ok!

I am running out of time here today, so even though I have ticked off
several of the tasks on the list, it will be next week where I get back
with an update!

BR,

/Joakim

