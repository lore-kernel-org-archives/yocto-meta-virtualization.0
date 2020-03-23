Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.49551.1584959764000357689
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 03:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kkknYiwN;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1177; q=dns/txt; s=axis-central1;
  t=1584959764; x=1616495764;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=hAjOwUFREQENaCh4SsMLeV0gSOVu6bCem4viwjrwGqw=;
  b=kkknYiwNar8Lls2fqY7hvMjxmOEqaWgSxz0eWAW7bhL3Ht4MeVCMhr63
   zKYsTyvuUsWPZXoD1FfTyA76mTm8osLy6EeiRH9aa6Nv3vSwUR7pL4etG
   P+R9MJBFnEp3BgzMS1bJ+suyqkLw3KN8Nf+e4O0n85BUVoJXhzUtps0mp
   qqUB1r4m7jRmjU15zBGhcZbLa2dGz6gtFSY6n37X+cLPTnk9U+cRHXynl
   xsoYr0qQIpF5j7TRP84b0OMuFo3cFCRGVMaKIgNOjsVE7n6fGcMleA91j
   WAq+MbgVfNd0XEgKc87F4sO3OFlTtnK/xsn2CCRusmFDkBL3bGH6kcDLZ
   Q==;
IronPort-SDR: wZTd8Q0pWD1yRLXb56fPjNOzzh0v+8kTk2VZv0yll4M1eFJj6K1SZtEfpvcz6M7riWcPUkEGqp
 7zm0DRYJAJ1iRsMcqGwa9LKACT0215LTm7FItDTZ/d3BBAKD+jI90JxlROgJhQWf7JlmvI3F8q
 /mPw2vZ00wqnfVuzKoSc/EEIy50Xk8+m/0OfjT99ZfR3hY55H8hiHwc2f1BvBJxYi3VldbchdK
 QuOeAegTqmXBlTGewl/XjqjMteJbQIudNP7FN80vyMT3TtcNzo3AJoXGILUFbsMxgh7yrb9+9c
 Hz4=
X-IronPort-AV: E=Sophos;i="5.72,296,1580770800"; 
   d="scan'208";a="6624523"
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Subject: [Question] inconsistency in containerd recipes?
Message-ID: <4403ea62-42a2-f34c-251f-0135ba1988a0@axis.com>
Date: Mon, 23 Mar 2020 11:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi!

I am a but puzzled reading the containerd bitbake files. Now, I am not a
bitbake & c:o wizard, so I guess there might be some good explanations
and reasons that I simply do not get behind this:

In containerd.inc, there is

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM =
"file://src/import/LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"

and

S = "${WORKDIR}/git"

Then, in containerd-docker_git.bb there is (besides include containerd.inc)

SRC_URI = "\
	git://github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd \

and

S = "${WORKDIR}/git/src/github.com/containerd/containerd"

which to me would mean bitbake will no longer find the license file in
the src/import where it has been told it should be?

For containerd-opencontainerd_git.bb, there is no destsuffix used and
the license file ends up where bitbake expects it to be.

To me, it seems there are inconsistencies here?

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

