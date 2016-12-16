Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39FDCE00E4C; Fri, 16 Dec 2016 09:08:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.67 listed in list.dnswl.org]
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64B6FE00E47
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Dec 2016 09:08:15 -0800 (PST)
Received: by mail-it0-f67.google.com with SMTP id n68so3261078itn.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Dec 2016 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=vittpECfQTzT9+gKxp/hW50G5LkPnupXX6DGlhHh67s=;
	b=Z+rZ7blsxmzkMfY7eEG6MspJDO8wRtvrDz52nNHubzsZ6FKrdFm6P3uEugYsnQ4PiB
	wxZPhjA24HHWgl2kUkfz7Sc6tiRXvKvVxJ6LhVVdRkLT0+0PSeKHoySHpMB4uFpV51TX
	yOgl3FTCMs4h9Eam0J/TlkB9rL6gvi5ZdW6pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=vittpECfQTzT9+gKxp/hW50G5LkPnupXX6DGlhHh67s=;
	b=Vxhk50EeFmOKBJBt66jAFo30pfTi0tkhP0hAGfepzSBJBjXWES4n3e9w8nbtltjIWx
	5P6lWPnflXx+MYT59x+pwxeAIOSPgXkj6w6natos9b40wcLYf0ndo94XJQP5N6TSbgEQ
	cJiTcI1spFyOz50izXVd73whmp9rkjoOQNmpRJ+VpVvS4wOc/MD3RqwRjZnVQ/fxcoNy
	qI3piV6F314mo7OZ5fpbszEE8mcUkXH/nNTxCOVBScA/lxkwILN4hgskKjyfMKzgsykz
	TASadpCfiGqIptVIEfcLXEFVhgRVI4iGIiDLhkkF2hBgGB9BBX4Tyybib39mbOY/kJDf
	Eiqg==
X-Gm-Message-State: AKaTC000K0HxKuWoGeuh1XQYaIrgjh1xEnESz7zYW2WpQ4br3j2jbwBZJlu22Nzyr7XYfw==
X-Received: by 10.36.200.10 with SMTP id w10mr3621057itf.21.1481908095048;
	Fri, 16 Dec 2016 09:08:15 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	h76sm2988802ioi.43.2016.12.16.09.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 09:08:13 -0800 (PST)
References: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <64868386-9609-58b5-ebc5-6b85b07843c0@cardoe.com>
Date: Fri, 16 Dec 2016 11:08:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>
Subject: Re: [PATCH] README: make it easier to copy and paste send command
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
X-List-Received-Date: Fri, 16 Dec 2016 17:08:19 -0000
X-Groupsio-MsgNum: 2148
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="L1rKDdwPtj9T06mabd8bMktbLss9tUHH3"

--L1rKDdwPtj9T06mabd8bMktbLss9tUHH3
Content-Type: multipart/mixed; boundary="8mgNtW587LicB4qdsxTQa4go5WQFjtHLG";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <64868386-9609-58b5-ebc5-6b85b07843c0@cardoe.com>
Subject: Re: [meta-virtualization][PATCH] README: make it easier to copy and
 paste send command
References: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>
In-Reply-To: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>

--8mgNtW587LicB4qdsxTQa4go5WQFjtHLG
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/22/16 11:01 PM, Doug Goldstein wrote:
> The git send-email command on most shells requires the subject-prefix t=
o
> be quoted and with the trailing quote I always think it is from the
> README and then realize after the fact I have to edit it. I used $ to
> imply the shell prompt since that seems pretty common across the
> internet.
>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/README b/README
> index c60044d..2578f90 100644
> --- a/README
> +++ b/README
> @@ -42,7 +42,7 @@ Maintainers: Raymond Danks <ray.danks@se-eng.com>
>               Bruce Ashfield <bruce.ashfield@gmail.com>
> =20
>  When sending single patches, please using something like:
> -'git send-email -1 --to meta-virtualization@yoctoproject.org --subject=
-prefix=3Dmeta-virtualization][PATCH'
> +$ git send-email -1 --to meta-virtualization@yoctoproject.org --subjec=
t-prefix=3D'meta-virtualization][PATCH'
> =20
>  License
>  -------
>=20

Ping? Yes/no?

--=20
Doug Goldstein


--8mgNtW587LicB4qdsxTQa4go5WQFjtHLG--

--L1rKDdwPtj9T06mabd8bMktbLss9tUHH3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYVB99XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUpXEQAJCcoUKYtlXf+7affoZI1mnp
fQ/IIU+YD7fxK7Aq6SUnSCCk2/Xd3yTJaCXgwnboE+9gRkzJpKQXiBax7gNi9y2f
0/LuUp6sQGfYlriXXcYCabCC3kSkTlPZcPDlLEl8jk/rc1OD3VQ/BWaPn7oyt8MZ
4fNgpF1hntbKBOG3WY0veXUFoMHdy7LdkGH9BKyfZF2Gf8Byy4ONtATz2a75YTQF
1jD81RtsELlueBefBtf/+XZcuwGInaew6gHIoA/eNDdbyiX2YikGV6i2hv4G7Esf
C2HpbC0GQ1rci8V//YUoFK/M0AZBh5qzwlfrL9kuH6BgOsSgkbPoVlqi192D7nHd
K669fCgy/zkDXA1IDBojq/aNOI9yMK+8hAsVWGFJykSfyw3OWs9myKKUslYFMniW
4cftWmgYXw9vAhhcmZ6HEDm3TnJYkjCXzBmKnzDaJ3gOkuIEu0T41OTIBgXDn99E
oAj5OwO0PUvhJCe0zAWplSho9Dqj8Q2PCAE5pocC+3jnTem2FfImyCk13YWKyqct
7pHhX27b9CtPGf8p/TfdzaWL0oIGLTO8xpdIXLNwRIdOW/IprbWL1rXH7+fVS/aH
en1Zp067n0HRgnvYfsQTe4E5gFegFIKCdOEE2Oe73KRa1b7iHFXmSTTAMweVEp2H
kOmj/H7KalFxUsjlZZNK
=r/Ys
-----END PGP SIGNATURE-----

--L1rKDdwPtj9T06mabd8bMktbLss9tUHH3--
