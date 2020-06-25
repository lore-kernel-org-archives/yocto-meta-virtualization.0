Subject: Re: Xen On Raspberrypi-4. Not able to build the xen image.
To: meta-virtualization@lists.yoctoproject.org
From: "Ashishx88" <ashish.emailaddress@gmail.com>
X-Originating-Location: Alibag, Maharashtra, IN (103.39.247.26)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Jun 2020 22:17:34 -0700
References: <CAEkELtAmLmnY7iGhu5exxL2xWhmfYKeRxXkaXBTNm3FqutsaMA@mail.gmail.com>
In-Reply-To: <CAEkELtAmLmnY7iGhu5exxL2xWhmfYKeRxXkaXBTNm3FqutsaMA@mail.gmail.com>
Message-ID: <11940.1593062254922790709@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="H4QY6e5uMEifaYUwRljJ"

--H4QY6e5uMEifaYUwRljJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddhartha ,

" package openssh-8.1p1-r0.aarch64 conflicts with dropbear provided by dro=
pbear-2019.78-r0.aarch64"
Can you cross check ssh server package .
By error log it seems that you are trying to install both dropbear & opens=
sh & hence the conflict.
At any time you can have only one of them

Thanks ,
Ashish.

--H4QY6e5uMEifaYUwRljJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddhartha ,&nbsp;<br /><br />"<span style=3D"font-weight: bold;">packag=
e openssh-8.1p1-r0.aarch64 conflicts with dropbear provided by dropbear-201=
9.78-r0.aarch64"<br /></span>Can you cross check ssh server package .&nbsp;=
<br />By error log it seems that you are trying to install both dropbear &a=
mp; openssh &amp; hence the conflict.&nbsp;<br />At any time you can have o=
nly one of them&nbsp;<br /><br />Thanks ,&nbsp;<br />Ashish.

--H4QY6e5uMEifaYUwRljJ--
