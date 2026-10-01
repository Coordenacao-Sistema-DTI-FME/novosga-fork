(function () {
    'use strict';

    console.log('painel-voz.js carregado');

    window.PainelVoz = {

        falarChamada(chamada) {
            if (!chamada) {
                return;
            }

            const senha = chamada.senha || '';

            if (!senha) {
                return;
            }

            const local = chamada.local || '';
            const numeroLocal = chamada.numeroLocal || '';

            console.log('[painel-voz] Falando:', {
                senha: senha,
                local: local,
                numeroLocal: numeroLocal,
            });

            const texto = `Senha ${senha}, dirigir-se ao ${local} ${numeroLocal}`;

            const utterance = new SpeechSynthesisUtterance(texto);

            utterance.lang = 'pt-BR';
            utterance.rate = 0.8;
            utterance.pitch = 1;
            utterance.volume = 2;

            window.speechSynthesis.cancel();
            window.speechSynthesis.speak(utterance);
        },
    };
})();