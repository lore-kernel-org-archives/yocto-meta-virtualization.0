Return-Path: <mhalstead@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADD37E00C81; Fri, 13 Sep 2019 16:01:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE autolearn=unavailable
	version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.221.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28EEDE00DD1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Sep 2019 16:01:22 -0700 (PDT)
Received: by mail-wr1-f65.google.com with SMTP id l16so33425625wrv.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Sep 2019 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language;
	bh=oU6bDakwQdngBBBoI7/Km9JrxmHc5hMcVoDBHwfC6P4=;
	b=Es6cq/czQtZSybYatAKgYmcHA6K398Nwk8psB75U7pWwgtdf0+FBlCOuPCF1ayH7bD
	G5khCV9CgVeEjxrWXzPMfpHSnjuj69vN6vmZMrOZR8o5d1iwoURBTf+yeJSCWNBhkvfs
	uPcrpehuEW8KZQcH8iw8UvsJwO4tdmzm0VEk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language;
	bh=oU6bDakwQdngBBBoI7/Km9JrxmHc5hMcVoDBHwfC6P4=;
	b=ubqUWTRcS6QF581UcXy+WsNOndNjyaizb/fwAefCcYlhIdM+psmMhI7aJPI4bCa7cq
	Lp67fUDa8cINXzvvdrb1U8fCBjjQrvPPDprLnuyAPwY16LBhbSBDxDseTjCiai+vw6i2
	XlvV2gZ7EPSTKNdz9yR/x7n9bMaiTPQYk9NgvbQgkcNED6XaccA6OD9B3SiMBYuRDkDV
	8rE1U8mM6Yl7XfFiWZM6K5Y658xzjoqOlw0SRrN9xfcPNSdkYtUpcFPLBb7IU4vaPajp
	1cS7uYGoGBfhR5px/TpKL5qGGJEecEShyJYpCa25rIa/8Q+PNpwiC7M1k9R6neHOyF4r
	mp6Q==
X-Gm-Message-State: APjAAAWDvNa5pFogSgTWYD1RonlsqOyXpuzW0QaZCpgjZa/xSpRPVK6+
	jnCuoSnxqGkHBh3zhisl26brPw==
X-Google-Smtp-Source: APXvYqxSny/YKylL5OWjG/GcvBaoN530zqIHkGr9PDgycW4p4CgOcQTaV2Sxawr1uR1YqS7jjK8KRw==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr473088wro.187.1568415681833; 
	Fri, 13 Sep 2019 16:01:21 -0700 (PDT)
Received: from localhost.localdomain ([194.187.249.59])
	by smtp.gmail.com with ESMTPSA id
	q19sm43621286wra.89.2019.09.13.16.01.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Sep 2019 16:01:20 -0700 (PDT)
To: automated-testing@yoctoproject.org, conferences@yoctoproject.org,
	eclipse-yocto@yoctoproject.org, linux-yocto@yoctoproject.org,
	members@yoctoproject.org, meta-amd@yoctoproject.org,
	meta-freescale@yoctoproject.org, meta-intel@yoctoproject.org,
	meta-lsi@yoctoproject.org, meta-mentor@yoctoproject.org,
	meta-ti@yoctoproject.org, meta-virtualization@yoctoproject.org,
	meta-xilinx@yoctoproject.org, pointofcontact@yoctoproject.org,
	poky@yoctoproject.org, toaster@yoctoproject.org, tsc@yoctoproject.org, 
	wg@yoctoproject.org, yocto@yoctoproject.org, yocto-ab@yoctoproject.org, 
	yocto-advocacy@yoctoproject.org, yocto-announce@yoctoproject.org,
	yocto-bsp@yoctoproject.org, yocto-builds@yoctoproject.org,
	yocto-finance@yoctoproject.org, yocto-infrastructure@yoctoproject.org, 
	yocto-perf@yoctoproject.org, yocto-security@yoctoproject.org,
	yocto-website@yoctoproject.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <c875b530-6d7e-96c8-f93a-fb6cf801b338@linuxfoundation.org>
Date: Fri, 13 Sep 2019 16:01:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Sep 2019 16:14:16 -0700
Subject: Mailing list update September 15th - platform change delayed
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
X-List-Received-Date: Fri, 13 Sep 2019 23:01:26 -0000
X-Groupsio-MsgNum: 4606
Content-Type: multipart/mixed; boundary="------------411857EE089012BBC9AD03CC"
Content-Language: en-US

--------------411857EE089012BBC9AD03CC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This Sunday I will take the Mailman mailing lists offline for updates in
preparation for the platform change. As part of the update I plan to
change the list addresses to their new dedicated domain
@lists.yoctoproject.org so we can start changing addresses in the
MAINTAINERS files and elsewhere.

Moderators, thanks for helping by clearing out the queues in advance. If
you have outstanding moderation or trouble clearing your queue please
reach out to me.

I will send a follow up e-mail with a new time line for the platform
change after these updates are in place.

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--------------411857EE089012BBC9AD03CC
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF13fTkBCAClvac608cisaG9YFWRyH8lTo8Hs9UQLXedH0wlOILJJl5apA+Y
hA/nLtS678OwyMBC8Gc1n/zPFtH7Aagw9BRObENutD7UtjJ6juz/1u2CJFMaYHeu
z6FqBoHFeRJC0sNhTxQkOzk97hyJesgNhcKcXuEAZ09Pi3RBXUxeru9ZTv2azjjJ
vV3ULSXL6AUnpXMeuvMGwb8HqAM1mqTtn4WcIiqqa6nEp+VvPFr3PGU/alA/9S2N
2OqA9/37tGMWFu34z/s/SHRROEUhVb8LRhz7NkuBtF3nAA5R0RRxT/qK2m0LnyDt
WuPtLHMfNt2KDLusctK+nub60+p3CY4OKo8tABEBAAG0ME1pY2hhZWwgSGFsc3Rl
YWQgPG1oYWxzdGVhZEBsaW51eGZvdW5kYXRpb24ub3JnPokBVAQTAQgAPhYhBHXA
FTA0Glu9zfX2sne7QvI6aljTBQJdd305AhsDBQkB4TOABQsJCAcCBhUKCQgLAgQW
AgMBAh4BAheAAAoJEHe7QvI6aljTuUUH/jWg/RepKzUnzJIzp2vLALFDhlKeg6Tw
m7uukiI8CF4TN7JctdBVk32sAvttAwdRUOmv8kTzkcuAiy8CGQpIoKDpbnXDfuds
2mxr9Z7SGqzIjTAKqgEIhFpnWCTPZooAAzyqCTEdu5UpWNHuRiZk1PnFNIyCSDN4
P4Kt3fcOZrRPtDkx4I9910O60ald0NtEfKSx01cfhhgEGbIbM7Ui2lui996jtsX7
E4G+qtrnfpNo0XGMoyiqLDFkNYqXG7VwaU6Kt1R1XsHG7zrttz1H8NcEXhtg8HX+
mxEfhK8YdRKs97aJvqv1uJVxNB2aA/sQYFcXsoeGm9H+EOreX0au0Va5AQ0EXXd9
OQEIALNgB4lRYpXgHPgdx7zUghVknXLCuFAN9XDRButxPlwpsbv+n9Ce2OH7bUae
7GJtoz1TfBU16XJrvbiwe8NiHxCBke3vjzmqIpkyi0ABbM+Rqk1H5U+TGr1qIcwG
8Xs2Ksat87kwORV8cQryGx7fIOB5t12Zp7wy8nQr+E1cyUo/JBm5FY2JQnH+D7QE
Fept/XLgW/UEiqrDYlrNnxZPfzh8Ka8l/gj2B8IYq1pNe99hqCvbBfnhQ8DYI4Ze
93nkOBTXVGKyz6FcaZy/pSfA0N2q7r9FgAOVxEN5usXwkwSmukDw4OVMtQm9sRvL
BiF04qMGRD/JCHPozYFUQYy1xcEAEQEAAYkBPAQYAQgAJhYhBHXAFTA0Glu9zfX2
sne7QvI6aljTBQJdd305AhsMBQkB4TOAAAoJEHe7QvI6aljT7IUIAJTasNuqjZXA
bWFdwzQ6lv2o1S9uZ244rCzJlD/nKpTGHCzhZ4dUDArjk6Wq5U66gmkwYdKc9gmu
6B81tBI4Tihv7dyh7BtX83VuY73TwveLfRrZfMmD1WR61K4I4NaFO9zV/9dT3sSB
vtVRi+hxEv50O1aNBqYqMUC/4zp4NV0/F3jzRSd+PSkuiASZ4U/za/SDorkNoRa5
aWSyRMfuI3FGATRUwbtt4zLeLdx5NUmKcPJCXuC1101n8C0TrP+fjr0TmyDibYF+
lSYycwE89ixVahQDFiQ7EiqzLJRaYbhNhbC8ZcrMhjaWRQRFlSk+CtjXCOaZSiiA
SpP9CcOd05I=3D
=3DtSXc
-----END PGP PUBLIC KEY BLOCK-----

--------------411857EE089012BBC9AD03CC--
