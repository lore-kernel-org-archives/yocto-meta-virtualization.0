Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.541.1579301225231457440
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 14:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=xrmKzaSO;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0BDBA5C78DE;
	Fri, 17 Jan 2020 23:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579301222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okxt7Tsf486fQYfmeEBCoJZXaMAJtOsNIhD8yFh/YjA=;
	b=xrmKzaSOrvLHP0ienQbG1y6MeUKu556dYCJjfHa81RiWaw0jKdprRhZhG3kZwpwbgdvBWA
	o8hTx5JTqGhFi67nkLbhbMkbVr3JXkAmxnw3xnddPYfQ2QmcelWFmuNP+DrckWd6kCCj0T
	8dLJuPYbxJRrEnEkCX1WCti5LVMuq4I=
MIME-Version: 1.0
Date: Fri, 17 Jan 2020 23:47:01 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Tim Orling
 <timothy.t.orling@linux.intel.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH 1/2] conmon: bump to version 2.0.9
In-Reply-To: <CADkTA4P08iFSf76K5UC+JuBRPCSg_VKfVRucAsEpov=pd8T+VA@mail.gmail.com>
References: <20200115232936.23207-1-stefan@agner.ch>
 <CADkTA4P08iFSf76K5UC+JuBRPCSg_VKfVRucAsEpov=pd8T+VA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <2d6385f23889a35578e4238159d87ebd@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-01-17 22:27, Bruce Ashfield wrote:
> I've merged the version bumps to master.
> 
> But I'm still undecided on bringing them to Zeus. Although they are
> largely bug fix releases .. they aren't entirely bug fixes.

I cannot say much about this since I (unfortunately) do not use podman a
lot yet. It seems like a lot of bug fixes though :-)

> 
> I'd rather not increment versions on the older branches unless we are
> fixing a CVE, or individual patches are difficult to backport.
> 
> Thoughts ? I'm open to being convinced to do the version bumps on the
> released branch, but didn't see anything really compelling in the
> shortlogs.

It probably would be good if we at least bump conmon as the release
notes say "Version 2.0.1 or greater of Conmon is strongly recommended".

--
Stefan


> 
> Bruce
> 
> On Wed, Jan 15, 2020 at 6:29 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Bump to latest version 2.0.9. This also makes our Makefile fix obsolete
>> as the fix has been aplied upstream.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  .../{conmon_2.0.0.bb => conmon_2.0.9.bb}      |  3 +-
>>  ...ail-if-clean-is-called-without-a-bui.patch | 31 -------------------
>>  2 files changed, 1 insertion(+), 33 deletions(-)
>>  rename recipes-containers/conmon/{conmon_2.0.0.bb => conmon_2.0.9.bb} (83%)
>>  delete mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>>
>> diff --git a/recipes-containers/conmon/conmon_2.0.0.bb b/recipes-containers/conmon/conmon_2.0.9.bb
>> similarity index 83%
>> rename from recipes-containers/conmon/conmon_2.0.0.bb
>> rename to recipes-containers/conmon/conmon_2.0.9.bb
>> index f4e2cd6..fc76f15 100644
>> --- a/recipes-containers/conmon/conmon_2.0.0.bb
>> +++ b/recipes-containers/conmon/conmon_2.0.9.bb
>> @@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>>
>>  DEPENDS = "glib-2.0"
>>
>> -SRCREV = "e217fdff82e0b1a6184a28c43043a4065083407f"
>> +SRCREV = "60b42f20f222df9da07a01ee444327348b9f54ee"
>>  SRC_URI = "\
>>      git://github.com/containers/conmon.git \
>> -    file://0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch \
>>  "
>>
>>  SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
>> diff --git a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch b/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>> deleted file mode 100644
>> index 8d2b473..0000000
>> --- a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From 6ef63dfcc65d5401bc7cc7170d569cefcdadcb38 Mon Sep 17 00:00:00 2001
>> -From: Stefan Agner <stefan@agner.ch>
>> -Date: Fri, 30 Aug 2019 17:49:22 +0200
>> -Subject: [PATCH] Makefile: don't fail if clean is called without a build
>> -
>> -Do not fail when calling the clean target without building first.
>> -
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ----
>> - Makefile | 3 +--
>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index fb0e4fb..b525595 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -66,8 +66,7 @@ bin:
>> -
>> - .PHONY: clean
>> - clean:
>> --      rm -f bin/conmon src/*.o
>> --      rmdir bin
>> -+      rm -rf bin/ src/*.o
>> -
>> - .PHONY: install install.bin install.crio install.podman podman crio
>> - install: install.bin
>> ---
>> -2.23.0
>> -
>> --
>> 2.17.1
>>
>> 
