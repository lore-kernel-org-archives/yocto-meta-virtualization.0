Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF810E00D2A; Mon, 15 Apr 2019 18:46:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.41 listed in list.dnswl.org]
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A865EE00D08
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2019 18:46:47 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id d24so16210333otl.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2019 18:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0RXB/nJlSXO2drkDNx9/P4du+c1TvkZQ5qpmjkxFyhU=;
	b=RYj6QyqZze9hyxQQdaUaqYx93zEH5wyG6Edx/N4VjEmMG0KPtpMyoGc7Qmo/BZc1ZM
	KDD/EnhOV3/qxQ2Qwuh9pSp3XGUtQKwuQBAcjagZ0X48rzru6IArOGehu63aaVIq6ZQf
	xsN4Vzt1+w/IPZEsieeNRjCJ1ByMz17Pe6/rySi9ZGLU14OpLNsPNQeksWqt2H4r7T4Y
	DLxf0N8DLJrGn8vOGV1CSZ9cWY88vvBCWkYjMdPp3IpAeCHpR47e7rZ4wc92unCMQL6n
	f8S6/kCmD2O06imtfyDtfAW8S8oPC+ffjqgkKCz6rou4DFeieut3c3N/yHYLZumwTK6l
	QkUw==
X-Gm-Message-State: APjAAAVQiYx8sbwNxHlWjyzvyhXBovxaYOqP/8QfQ/YmACy44nEA+tXf
	YOIP8QA5BZz7mIgeQ560qiCz4/WVC2Np382WS12RnxbN
X-Google-Smtp-Source: APXvYqxSGxdnc/V4ePB7VjWYv5h0vIYB8ZxNBsv5CdGJyR9BmXsp45tXyPnuKymQaSgnMhS5BR0YAGMM2SDaB9fWPxo=
X-Received: by 2002:a9d:57c2:: with SMTP id q2mr47618070oti.313.1555379206884; 
	Mon, 15 Apr 2019 18:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
In-Reply-To: <5E914B57-EE72-4830-8E45-8BC19CB7307E@arm.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 15 Apr 2019 21:46:35 -0400
Message-ID: <CAPuovELwBEHwrU=jYFak2HqwcyXtSDspCDuKi2HSWAydLrUm=A@mail.gmail.com>
To: Sathees Balya <Sathees.Balya@arm.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Dev86-native dependency
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
X-List-Received-Date: Tue, 16 Apr 2019 01:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 9:05 PM Sathees Balya <Sathees.Balya@arm.com> wrote=
:
>
> Hi,
>
>
>
> The xen recipe has a hard dependency on dev86-native package (meta-virtua=
lization/recipes-extended/xen/xen.inc). It does not allow us to build for a=
arch64 natively for Arm. At the moment, we have a workaround in the bbappen=
d file for xen to remove the dependency.
>
>
>
> DEPENDS_remove =3D "dev86-native"
>
>
>
> Can the recipe be made generic so that both x86 and Arm can be built with=
out the need for the above workaround? Thanks.
>

I am not sure I am following you correctly. But I believe what you are
looking for is to drop "dev86-native" from DEPENDS, where it is
currently listed, and instead list it in something like

DEPENDS_x86 =3D "dev86-native"

in the xen.inc file. ie. make use of the overrides mechanism to only
require it for x86 arch. Am I close?

MarkA

>
>
>
>
> Regards,
>
> Sathees
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

