Subject: Re: devtool modify docker failure
To: meta-virtualization@lists.yoctoproject.org
From: s.anandje1@gmail.com
X-Originating-Location: IN (103.161.30.83)
X-Originating-Platform: Linux Chrome 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Apr 2021 03:53:19 -0700
Message-ID: <qvvA.1619088799002052755.HOj2@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="ghMMoDYa58CuvBGTOgR4"

--ghMMoDYa58CuvBGTOgR4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have made my yocto setup successfully.

The layers I have included is:

$ cat conf/bblayers.conf

${TOPDIR}/../poky/meta \

${TOPDIR}/../poky/meta-poky \

${TOPDIR}/../poky/meta-yocto-bsp \

${TOPDIR}/../layers/meta-openembedded/meta-filesystems \

${TOPDIR}/../layers/meta-openembedded/meta-networking \

/${TOPDIR}/../layers/meta-openembedded/meta-oe \

${TOPDIR}/../layers/meta-openembedded/meta-perl \

${TOPDIR}/../layers/meta-openembedded/meta-python \

${TOPDIR}/../layers/meta-virtualization \

I want to work on docker source code so I thought of fetching the source c=
ode from devtool.

But while I'm using devtool I'm facing an issue.

$ devtool modify --no-same-dir --extract docker-ce workspace/sources/docke=
r

ERROR: Command Error: 'sh -c 'PATCHFILE=3D"0001-libnetwork-use-GO-instead-=
of-go.patch" git -c user.name=3D"OpenEmbedded" -c user.email=3D"oe.patch@oe=
" commit -F /tmp/tmps5pr6pui --author=3D"Bruce Ashfield <bruce.ashfield@win=
driver.com>" --date=3D"Fri, 6 Apr 2018 23:58:22 -0400"'' exited with 0=C2=
=A0 Output:

On branch devtool

Changes not staged for commit:

(use "git add <file>..." to update what will be committed)

(use "git restore <file>..." to discard changes in working directory)

(commit or discard the untracked or modified content in submodules)

modified:=C2=A0 =C2=A0libnetwork (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

ERROR: Logfile of failure stored in: ${TOPDIR}/build/tmp/work/core2-64-pok=
y-linux/docker-ce/19.03.8-ce+gitafacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3-r0=
/devtooltmp-lnnatl98/temp/log.do_patch.27786

Is there any workaround to overcome this error?

Thanks & Regards

Anand

--ghMMoDYa58CuvBGTOgR4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi,</p>
<p>&nbsp;</p>
<p>I have made my yocto setup successfully.</p>
<p>The layers I have included is:</p>
<p>$ cat conf/bblayers.conf</p>
<p>&nbsp; ${TOPDIR}/../poky/meta \</p>
<p>&nbsp; ${TOPDIR}/../poky/meta-poky \</p>
<p>&nbsp; ${TOPDIR}/../poky/meta-yocto-bsp \</p>
<p>&nbsp; ${TOPDIR}/../layers/meta-openembedded/meta-filesystems \</p>
<p>&nbsp; ${TOPDIR}/../layers/meta-openembedded/meta-networking \</p>
<p>&nbsp; /${TOPDIR}/../layers/meta-openembedded/meta-oe \</p>
<p>&nbsp; ${TOPDIR}/../layers/meta-openembedded/meta-perl \</p>
<p>&nbsp; ${TOPDIR}/../layers/meta-openembedded/meta-python \</p>
<p>&nbsp; ${TOPDIR}/../layers/meta-virtualization \</p>
<div>&nbsp;</div>
<p>I want to work on docker source code so I thought of fetching the sourc=
e code from devtool.</p>
<p>But while I'm using devtool I'm facing an issue.</p>
<p>&nbsp;</p>
<p>$ devtool modify --no-same-dir --extract docker-ce workspace/sources/do=
cker</p>
<p>ERROR: Command Error: 'sh -c 'PATCHFILE=3D"0001-libnetwork-use-GO-inste=
ad-of-go.patch" git -c user.name=3D"OpenEmbedded" -c user.email=3D"oe.patch=
@oe" commit -F /tmp/tmps5pr6pui --author=3D"Bruce Ashfield &lt;bruce.ashfie=
ld@windriver.com&gt;" --date=3D"Fri, 6 Apr 2018 23:58:22 -0400"'' exited wi=
th 0&nbsp; Output:</p>
<p>On branch devtool</p>
<p>Changes not staged for commit:</p>
<p>&nbsp; (use "git add &lt;file&gt;..." to update what will be committed)=
</p>
<p>&nbsp; (use "git restore &lt;file&gt;..." to discard changes in working=
 directory)</p>
<p>&nbsp; (commit or discard the untracked or modified content in submodul=
es)</p>
<p><span style=3D"white-space: pre;"> </span>modified:&nbsp; &nbsp;libnetw=
ork (modified content)</p>
<p>&nbsp;</p>
<p>no changes added to commit (use "git add" and/or "git commit -a")</p>
<p>ERROR: Logfile of failure stored in: ${TOPDIR}/build/tmp/work/core2-64-=
poky-linux/docker-ce/19.03.8-ce+gitafacb8b7f0d8d4f9d2a8e8736e9c993e672b41f3=
-r0/devtooltmp-lnnatl98/temp/log.do_patch.27786</p>
<p>&nbsp;</p>
<p>Is there any workaround to overcome this error?</p>
<p>&nbsp;</p>
<p>Thanks &amp; Regards</p>
<p>Anand</p>

--ghMMoDYa58CuvBGTOgR4--
