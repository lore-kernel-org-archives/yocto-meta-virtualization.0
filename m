Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99B79E00288
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Nov 2013 19:42:08 -0800 (PST)
Received: by mail-lb0-f171.google.com with SMTP id q8so2735779lbi.30
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Nov 2013 19:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pUfGwgQZzBtLzoKC7IihgmkdAi5ijiQQz6M1mmbwxow=;
	b=dRGDHV4138/ZEC7Cx6u3CDU3qpZ3NqoF1OgqskQeUaEoAepJj6BYa0JTSwzGRAD/cS
	KvHbFoqDYGB6pTOYhbafXyB2CZg3XtQcJ2QrimIURhFCQ+UcnbuM5EjeShTGrQg2hVPq
	J0MbCJ+ZZGNA91eE609PHqdaxJZa8F4o0+bhyjDizUb9L6Kzp4Y5uOTXHvitKjSe4hhW
	wGM8SgwKwdUHfjbq36NZ9lPEsLhBHxRH+Y7ADWqtDLxZ+eFP41MHldlEr0fqwEmHAEQg
	MQh99BeOAmpYS3wPOx0xLmz3fSocAm1e193J33XO9dj69qd3II+B80OPEj7kQksXFBEv
	O/Bg==
MIME-Version: 1.0
X-Received: by 10.112.168.197 with SMTP id zy5mr5329119lbb.16.1384659727459;
	Sat, 16 Nov 2013 19:42:07 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Sat, 16 Nov 2013 19:42:07 -0800 (PST)
Date: Sat, 16 Nov 2013 22:42:07 -0500
Message-ID: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Xen Query ...
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
X-List-Received-Date: Sun, 17 Nov 2013 03:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Just sending a question to see who else is building Xen from meta-virtualization
master against yocto/oe-core master ?

All my builds have been failing on eglibc after adding xen and aufs to
the DISTRO_FEATURES.
I've worked around the problem and converted them to IMAGE_FEATURES to get full
functionality, but I'm wondering if anyone else has seen this .. I
want to rule out my
build machine, and it being a one-off, before I dig any deeper.

Cheers,

Bruce


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

