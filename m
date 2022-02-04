Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4946C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 15:29:06 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com
 [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web12.10656.1643988544534058928
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 07:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=R1KWEdi8;
 spf=pass (domain: bmw.de, ip: 207.54.68.120,
 mailfrom: prvs=027cbbfe7=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1643988544; x=1675524544;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jOxTwaBsUJfQbDVxA+kXk3QoNgf2u16A9Gv8DKXOHhk=;
  b=R1KWEdi8yg1RrBuWsb1frJTOMCRQ2pOBR9HZmIMwbB4BGBR/adJYhN6w
   iLQIcsuX4HypTpVW5BtAZVPzA5AdjuLfBUDuFoLQFO22UthQ2NdAaloiM
   +aWN1Uri7EIQ4i34N2skaDPs21nyiY6cSfM/MAAw87zswO9RNVT2eR9jh
   4=;
IronPort-SDR: 
 UK1uN6/VJEbgGTiEfFm6Wg7lDzlDUUsJ9UreOgij1i1dIoZoM7/XYY+V60+Ap6mUobvjZL/MF4
 Rw7m8JLoUjbdjsAURjXvv5lR28KTuKopJUs4Le3IYZiFIeNUH3P1lPEHjrZ/VyeRNcvI3g95Eg
 d8JnxTiRmh6a7iSQlvuxyEER62PXoqA6LtxqsR+R6mk8vIRHHqZLI7XR0yDqcuTLIm1dmXgnFG
 PcHQyUCZ3dgZIfQBfFA2TR2DARIaBiGI0TvDitxtTjGBAN70IyFkn0WvztKP5kkIElc8khs6Hi
 X0x3Zf1feRjW9qMI5a8i0yKA
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Feb 2022 16:29:02 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 04 Feb 2022 16:29:02 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp)
 ([160.46.167.66])
 by esabb4.muc with ESMTP/TLS; 04 Feb 2022 16:29:02 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Fri, 4 Feb 2022 16:29:02 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Fri,
 4 Feb 2022 16:29:01 +0100
From: <Mikko.Rapeli@bmw.de>
To: <joakim.roubert@axis.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Docker and GPLv3
Thread-Topic: [meta-virtualization] Docker and GPLv3
Thread-Index: AQHYGaTZf9zDwwraPUeb8/rnq8HU7KyDX0QAgAAESoCAAAk8AIAABwYA
Date: Fri, 4 Feb 2022 15:29:01 +0000
Message-ID: <Yf1GPEF8l+//89/D@korppu>
References: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
 <CADkTA4PdJ5u7Mwm1sB9pceGXDhZQfm6gpBm5VEr7ggRnqH44+g@mail.gmail.com>
 <CAEhQi8mJcecVMa0xozbsP1DcxV1LwkN25x6GdEgApKMQvW9WNA@mail.gmail.com>
 <7a9d1bd3-730c-e84e-1f49-0860ea34eb95@axis.com>
In-Reply-To: <7a9d1bd3-730c-e84e-1f49-0860ea34eb95@axis.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <616DCE82FD8375459A7388DEE5870C97@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 15:29:06 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7048

Hi,

On Fri, Feb 04, 2022 at 04:03:52PM +0100, Joakim Roubert wrote:
> On 2022-02-04 15:30, Mans Zigher wrote:
> >
> > with our current understanding our customer cannot comply with GPLv3
> > so we have to avoid it at all cost.
>=20
> I think this is a situation where
>=20
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2=
/
>=20
> might come in handy, together with something like
>=20
> PREFERRED_VERSION_bash ?=3D "3.2.%"
>=20
> in the local.conf (or similar suitable configuration place).

While this would work, I can't recommend using meta-gplv2 as it contains un=
maintained
SW versions.

Just configure the build to avoid GPLv3 via distro config, e.g.

INCOMPATIBLE_LICENSE_append +=3D " GPLv3 GPLv3+ LGPLv3 LGPLv3+"

and configure SW components to build without GPLv3 dependencies.
lxc for examples compiles just fine without rsync and bash.

Additionally a lot of GPLv3 recipes can be enabled to build but be forbidde=
n
images images, e.g. in distro config:

WHITELIST_GPL-3.0 +=3D "bash"
PACKAGE_EXCLUDE +=3D "bash-ptest bash-dbg bash-staticdev bash-dev bash-doc =
bash-locale bashbug bash"

Some refactoring of SW architecture may be needed to remove any dependencie=
s to GPLv3
licensed SW. For development and testing GPLv3 components can often be used=
.

Cheers,

-Mikko=

