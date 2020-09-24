Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.18645.1600958793433890281
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=OAsyJh5N;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1083; q=dns/txt; s=axis-central1;
  t=1600958793; x=1632494793;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7R1aiZmDNo0rBUz5D45azCdpYrNNa+h+x2Fd5BMkMkg=;
  b=OAsyJh5NiqVgsRccY5mfCrqC1rQq0ZC6dv8Si1+4D9vmDVxi+H4UAS3Q
   7M9JX10pAkzM/nUOHU5RDgnrmRt7bOubD/aHbwRhTgfKFW7BCkisVOwMf
   ElxHs3Kc/NhtofkfDYt9UaltSBHV4ycJ1ztPGi4PB2zz/6GdDhkg+8ztf
   lxKghgHoM//xed4/G0Tu8rlrrrQ9Py5aVghstgoxrk+oB7Z1E0lNWrral
   xf4R0mFgjLF4goyZR2GraQFHrpGQ1wn2ZotaU8HqbsktHEzIytLdlil5y
   Bqbj12YL34IBEO/GOuBlWJyFKIbb4wCeCLvEgtqyVxwwrVH3HM5+h8a4q
   w==;
IronPort-SDR: 4xQhJ3PVjb1FPUCJzgoA0MHlqIjQghPiZ2xcFVOQ3Yz9+KMkhlhQYiiAyhCGBP/PVfq3DjPyDk
 R4YkV1Vj4z28vP1F7I1U4pndQRrh+3cI/lDMUev4iXyiFD6/ssbhg4k5TlxUTYfaoOb40UL9vw
 CLNZXkfEK7hGO+aItmeHRQFNJ1osrodA4R34BFe4LXykeodG4oIEDbY9h3AVpMvQnEWafUzIvW
 PsMiCbJdgu+fAWEg7W0uPXkV5KYm3giZLL/Xv1goZr3cM1QY5U7IYHN63HDzbIKbA2yeDK2npQ
 Kgo=
X-IronPort-AV: E=Sophos;i="5.77,298,1596492000"; 
   d="scan'208";a="12845672"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
 <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
Date: Thu, 24 Sep 2020 16:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2020-09-24 16:02, Bruce Ashfield wrote:
> 
> So I've decided to do this in a couple phases, since I keep making the
> bbclass more complex that it needs to be.

Sounds like a good plan! For what we know, concepts as "Big Bang" only
was successful once in the history of Universe, and it was not within
the field of software development. ;-)

> I've gone back through the patches, and have some questions/comments.
> Would you be willing to tweak things basd on those comments ? I
> realize it's been quite the delay from submission to this, so I can
> work through issues if you don't have the cycles.

Yes, I am happy to help in whatever way I can. Erik is a colleague of
mine but currently on parental leave, so I will try to fill his shoes
here now. But I have plenty of openembedded k3s build experience with
these recipes too, so let's do this!

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

