FROM debian

COPY bitcoin /bitcoin

ARG user=alice
RUN useradd -m -U $user
COPY bitcoin.conf /home/$user/.bitcoin/bitcoin.conf
RUN chown -R $user:$user /home/$user/.bitcoin

USER $user

ENTRYPOINT ["/bitcoin/bin/bitcoind"]
CMD ["-listenonion=0", "-gen=1","-listen=1", "-regtest", "-printtoconsole", "-logips", "-debug=1"]

