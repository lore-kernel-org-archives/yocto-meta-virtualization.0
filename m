Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1067E00D14; Wed,  1 May 2019 16:20:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (asselsm[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E09FEE00BAA
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 May 2019 16:19:59 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id v23so282969oif.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 May 2019 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=FPBYfvTHcQsnRE42GAYi4me/dysFignRzv5Hp18W9eM=;
	b=ML+wdMa5TDlfL2MNvOH7jWtD0b7tKI40+P/BNrKCsFmRcN7XygwSa/9BWfIoo8B6yx
	Sff6UdNaM+KPLWfgd2NWAWcfT2aZ1s4/R26T/ok+Am8iNz8ma2Emv/9jXh2YYspq164i
	SFwBEYqY+W0JvFAAmvHkHfixLKxwu+KSXpJDj0hvGwt585tNWKX5R92BMA+9GeV5IN5H
	ZPx7tDxAALCJTB9Kq1ePIUbIk0ev3ZCJu7TNx5Zhgg5lWaXjpNnlxIVLOC6bjOlpcYlU
	EuF0eVXpww8poKVNaPSIIRvvbQFl1r6CQ4s5E5Pro3BTja/zbir2a9ntIOPRktohqtBC
	2GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=FPBYfvTHcQsnRE42GAYi4me/dysFignRzv5Hp18W9eM=;
	b=eXQnvK/KxzcwJZ4mO1UJGmJlDq4JX0WqxnrvEEeckrLXoMvjzlz7E8zpaBd3D5w2MA
	T7dnKgPt6OqOhLGWBqM0ZjgWkvkgVBlTT1l8ttu4sijN1VJKiTIu3I6/ZX9ua2i/+8p5
	Tc6JVnzLEc2rkooyJs2Yhsz2VrMxrq11C2T5c7LC6gsWY4O0HwguZw/S3EhBQtzhOZ8f
	WwzgFOB9Hp8MEUhU3GJ9UBG7M/jaXll7k4xKoxpIPF1G47fdweI7JTMzFCAq42Nnd1hA
	Ew3gxEd2uhd10MDM9dg4D1AV5/T6+YqCnEd6eTjmRj8ef3QWcfYZpnhRHtK5UfndWEc1
	OZFA==
X-Gm-Message-State: APjAAAXFa8OVsaMSLzHHJ6AivMlEtP1u1bU/YNU15da+2zBh8PGa2UG2
	+lLUGvtNNjYl3tLGf/3diGI1QGLmwRPnGc1dlc/4TYYXiSQ=
X-Google-Smtp-Source: APXvYqy2BLU1tcPtysSMVpx4+ujPdhEBiqRmJ0HAbjtIjJjOZ+yIBx6zsEfEgldZNLubLHG34uzy60GHiAG8AsH86gA=
X-Received: by 2002:aca:d616:: with SMTP id n22mr573560oig.28.1556752799053;
	Wed, 01 May 2019 16:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <16a4a726e0c.108895fa735894.3116322584750949290@apertussolutions.com>
	<CAPuovE+daXfgHUzbgomeVTEBsKAe_Q2dHmL_4Nib8x=eEUd3ng@mail.gmail.com>
	<16a5a5010d8.11f07d573226409.4543764940550344893@apertussolutions.com>
In-Reply-To: <16a5a5010d8.11f07d573226409.4543764940550344893@apertussolutions.com>
From: Mark Asselstine <asselsm@gmail.com>
Date: Wed, 1 May 2019 19:19:47 -0400
Message-ID: <CAPuovELTc1EA+Gb7iN+6bAZ1e-D9hp7V=3WHr2JsCLsRU4CQhQ@mail.gmail.com>
To: Ken Bassford <kbassford@apertussolutions.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: Problems building under go.
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
X-List-Received-Date: Wed, 01 May 2019 23:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ken,

Adding the list back as someone else might see something I am missing...

Ideally and example which builds off of core-image-minimal or similar
would be useful. I did the following on master and was able to get and
run hello.go

1) Configure a new build
. ./oe-init-build-env ~/builds/go-now

2) Update the default local.conf
cat >> EOF << conf/local.conf
IMAGE_INSTALL_append +=3D " go git git-perltools go-runtime go-runtime-stat=
icdev"
EOF

3) Build
bitbake core-image-minimal

4) Run
qemu-system-x86_64 -enable-kvm -m 2G -kernel
tmp/deploy/images/qemux86/bzImage -drive
file=3Dtmp/deploy/images/qemux86/core-image-minimal-qemux86.ext4,media=3Ddi=
sk,if=3Dvir
tio,format=3Draw -nographic -serial mon:stdio -append "console=3DttyS0
root=3D/dev/vda rw"

5) On the running target run the following commands:
udhcpc eth0
go get -insecure github.com/golang/example/hello
cd go/src/github.com/golang/example/hello/
go run hello.go

And the result...
root@qemux86:~/go/src/github.com/golang/example/hello# go run hello.go
Hello, Go examples!

So the runtime of GO seems fine. As for your initial email you mention
that you have build issues within the bitbake environment, again there
are many examples of working GO recipes, is it possible for you to
provide me with one which is failing?


Mark

On Fri, Apr 26, 2019 at 11:42 AM Ken Bassford
<kbassford@apertussolutions.com> wrote:
>
> Hi Mark,
>
> Sorry for not getting back to you sooner.  I've been concentrating on ano=
ther problem as of late, why my OpenKMIP server cannot talk with the Go bas=
ed client I'm using.
>
> I'm fundamentally suspicious of the Go installation itself as it cannot p=
ull stuff in using "go get".  The GOROOT and GOPATH are set correctly, so I=
 presume something my build is not set correctly.  The bitbake file for my =
layer appears as follows ...
>

....

>
> It should be noted that this image is based upon the "core-image-lsb-sdk"=
 image.
>
> I figure I have to fix that before moving on to problems building the oth=
er modules (which may become a moot point as the kmip-go and it's dependenc=
ies do not seem to have as much functionality as go-kmip, and contains far =
less dependencies).
>
> Any pointers you can provide would be welcome.
>
> Sincerely,
> Ken Bassford
> Apertus Solutions
>
> ---- On Wed, 24 Apr 2019 15:25:19 -0400 Mark Asselstine <asselsm@gmail.co=
m> wrote ----
>
>  > On Tue, Apr 23, 2019 at 10:31 AM Ken Bassford
>  > <kbassford@apertussolutions.com> wrote:
>  > >
>  > > Hello Folks,
>  > >
>  > > I am currently attempting to bring in 16 Go modules ("kmip-go" plus =
all dependencies) into my OpenXT project and a select few are having proble=
ms compiling.  The modules that fail, fail during do_compile_ptest_base wit=
h a "vet config not found".  I have attempted to use the PTEST_ENABLED_${PN=
} =3D "0" or PTEST_ENABLED =3D "0" flags to no avail as these settings are =
being ignored.  The modules in question are "github.com/mattn/go-isatty" an=
d "github.com/uber-go/multierr".
>  > >
>  > > I am hoping that one or more of you in this audience that are famili=
ar with compiling golang modules in a OpenXT bitbake environment might be a=
ble to point me in the right direction.
>  >
>  > I don't know much about these modules but I do have my fingers in the
>  > go classes so I might be able to help. Can you type out the
>  > instructions I might be able to follow to reproduce this, ie. which
>  > layers and recipes go boom?
>  >
>  > MarkA
>  >
>  >
>  > >
>  > > Thanks in advance.
>  > >
>  > > Sincerely,
>  > > Ken Bassford
>  > > Apertus Solutions
>  > >
>  > > --
>  > > _______________________________________________
>  > > meta-virtualization mailing list
>  > > meta-virtualization@yoctoproject.org
>  > > https://lists.yoctoproject.org/listinfo/meta-virtualization
>  >
>
>

