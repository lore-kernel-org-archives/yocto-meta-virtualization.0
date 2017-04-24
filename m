Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A1EFE00AB6; Mon, 24 Apr 2017 01:43:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.174 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.174 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70452E007BA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 01:43:39 -0700 (PDT)
Received: by mail-yw0-f174.google.com with SMTP id l18so15189814ywh.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=kwp1wEQhy5LfqZfzmk+qY4vpvalCSXqn5ipK3omnQkU=;
	b=I6JzaMqKM81bn8OAgCYMTyE3HHnqtiXde9BSerz0C7OzdOjD6/4f7fjwNNqnv5y1w6
	JUfusO5ysW+Iqy1XbQqTy/j7V2PxkdjTbPrCdP2DxohTLmn1UjDEiXbkh0yydGH0GMY6
	ELRrJSTIs9V7sBhWUwMBkWm07CbPe8G2xqEXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kwp1wEQhy5LfqZfzmk+qY4vpvalCSXqn5ipK3omnQkU=;
	b=GCdTps/x/LM4N9xr1Xk30Y6OK41XveY0t1c3iiSbvQFUgUT3gX4AsnauELYk7KNoIk
	GMg0Pqz/RU6FqofdUa8kmKGpuCcqT1HXsKKs0+EI6GE6fhA9T1fNJJ3wj3AcWCZy5lti
	o67YIwTQER+dxpw+KaLpvRofBSgOHpt43L6QG7nHbaQfqw/EU6RundCS8JR6kMkrgzX4
	t7fMyxhUE3WaHxuGAnO0+FfGyp6UFHl94Ecca6BSpmSM8fHMjP+dXeZB/C89IO/SjVtR
	sYPNjos9+3Lhox8dzrJdG2dbOw3/AjcOsqaCWu4OMRb+4AuIgr20nqp5rCFSZSFNc95n
	mhaA==
X-Gm-Message-State: AN3rC/74K8bTfwL1SA1rgiD3Xzby2LgsuH7IAWJ5+kTdTM4E/puqSQGP
	6PfKbq/4BFUqMP7ub5Q7wFBpAC/+wTud
X-Received: by 10.157.8.183 with SMTP id 52mr12241400otf.251.1493023419312;
	Mon, 24 Apr 2017 01:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.5.74 with HTTP; Mon, 24 Apr 2017 01:43:39 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 24 Apr 2017 10:43:39 +0200
Message-ID: <CAFL6qn6ZwbuGK5fkr3GP--6GvYaHe58t65HegD5TiVGCuGHm_g@mail.gmail.com>
To: meta-virtualization@yoctoproject.org, meta-xilinx@yoctoproject.org, 
	yocto@yoctoproject.org, wendy.liang@xilinx.com, open-amp@googlegroups.com
Subject: Build a Yocto image to be the guest (Dom1) in a system that uses Xen hypervisor and petalinux image for Dom0
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
X-List-Received-Date: Mon, 24 Apr 2017 08:43:43 -0000
Content-Type: multipart/alternative; boundary=001a113edd0c8cc2a5054de59a54

--001a113edd0c8cc2a5054de59a54
Content-Type: text/plain; charset=UTF-8

Hi all,

Finally I have compiled an image using Yocto that includes the
meta-virtualization layer with DISTRO_FEATURES_append = " xen" in the
local.conf file. I understand that this must be used to build an image to
work as a Dom0 image with Xen. If I want to have a Dom1 guest image, would
be enough to change this DISTRO_FEATURES_append into " xen-guest" in the
local.conf file?? Do I need to do anything more?

In the other side, if I want to implement a system that is described in the
tittle of the message, do I need to include the open-amp layer to the guest
image that I want to build in Yocto? And has this layer enough support?

Looking forward to an answer,
Best regards,
Pello

--001a113edd0c8cc2a5054de59a54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Finally I have compiled an imag=
e using Yocto that includes the meta-virtualization layer with=C2=A0DISTRO_=
FEATURES_append =3D &quot; xen&quot; in the local.conf file. I understand t=
hat this must be used to build an image to work as a Dom0 image with Xen. I=
f I want to have a Dom1 guest image, would be enough to change this DISTRO_=
FEATURES_append into &quot; xen-guest&quot; in the local.conf file?? Do I n=
eed to do anything more?</div><div><br></div><div>In the other side, if I w=
ant to implement a system that is described in the tittle of the message, d=
o I need to include the open-amp layer to the guest image that I want to bu=
ild in Yocto? And has this layer enough support?</div><div><br></div><div>L=
ooking forward to an answer,</div><div>Best regards,</div><div>Pello</div><=
/div>

--001a113edd0c8cc2a5054de59a54--
